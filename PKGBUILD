# Maintainer: quest <quest at mac dot com>

pkgname=plymouth-theme-bgrt-nerd-git
pkgver=r2.g845f57b
pkgrel=1
pkgdesc="BGRT plymouth theme with Nerd Fonts"
arch=('any')
url="https://github.com/zquestz/plymouth-theme-bgrt-nerd"
license=('GPL-2.0-or-later')
depends=('plymouth' 'ttf-noto-nerd' 'ttf-sourcecodepro-nerd')
makedepends=('git')
provides=('plymouth-theme-bgrt-nerd')
conflicts=('plymouth-theme-bgrt-nerd')
install=bgrt-nerd.install
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    if git describe --long --tags >/dev/null 2>&1; then
        git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    else
        printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    fi
}

package() {
    install -Dm644 "${pkgname%-git}/bgrt-nerd.plymouth" \
        "$pkgdir/usr/share/plymouth/themes/bgrt-nerd/bgrt-nerd.plymouth"
}
