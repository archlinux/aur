# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Pylogmon <pylogmon@outlook.com>
pkgname=pot-translation-git
pkgver=r734.1b081b9
pkgrel=1
pkgdesc="一个跨平台的划词翻译软件 | A cross-platform software for text translation."
arch=('x86_64')
url="https://pot.pylogmon.com/"
_githuburl="https://github.com/pot-app/pot-desktop"
license=('GPL3')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
depends=('gcc-libs' 'glibc' 'glib2' 'gdk-pixbuf2' 'hicolor-icon-theme' 'gtk3' 'openssl' 'cairo' 'libxcb' 'pango' 'webkit2gtk' 'libsoup')
makedepends=('nodejs' 'pnpm' 'git' 'gendesk' 'rust')
source=("git+${_githuburl}.git")
sha256sums=('SKIP')
pkgver() {
    cd "${srcdir}/${pkgname%-translation-git}-desktop"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
    cd "${srcdir}/${pkgname%-translation-git}-desktop"
    pnpm install --force && pnpm prettier --write . && pnpm tauri build -b deb
}
package() {
    cp -r "${srcdir}/${pkgname%-translation-git}-desktop/src-tauri/target/release/bundle/deb/${pkgname%-translation-git}_1.6.1_amd64/data/usr" "${pkgdir}"
}