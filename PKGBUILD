# Maintainer: RiverOnVenus <aur@zhui.dev>
# Contributor: Yufan You <ouuansteve at gmail>

_pkgname=kawaii-gcc
pkgname="$_pkgname-zh-cn-git"
pkgver=r35.3b43056
pkgrel=1
provides=('kawaii-gcc-zh-cn')
conflicts=('kawaii-gcc-zh-cn')
pkgdesc='GCCコンパイラーを可愛くしましょう！Make your GCC compiler kawaii. '
arch=('any')
url='https://github.com/Bill-Haku/kawaii-gcc'
license=('GPL-3.0-only')
makedepends=(git gettext)
install=${pkgname}.install
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "$_pkgname"
    mkdir -p build
    msgcat -o build/zh-kawaii.po --no-wrap --use-first src/zh_CN-kawaii-patch.po src/zh-origin.po
    msgfmt -o build/zh-kawaii.mo build/zh-kawaii.po
}

package() {
    cd "$_pkgname"
    install -Dm644 "build/zh-kawaii.mo" "$pkgdir/usr/share/locale/zh_CN_kawaii/LC_MESSAGES/gcc.mo"
}
