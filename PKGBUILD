# Maintainer: RiverOnVenus <error@zhui.dev>
# Contributor: Yufan You <ouuansteve at gmail>

_pkgname=kawaii-gcc
pkgname="$_pkgname-git"
pkgver=r35.3b43056
pkgrel=1
provides=("$_pkgname")
pkgdesc='GCCコンパイラーを可愛くしましょう！Make your GCC compiler kawaii. '
arch=(any)
url='https://github.com/Bill-Haku/kawaii-gcc'
license=(GPL3)
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
    msgfmt -o build/ja-kawaii.mo src/ja-kawaii.po
}

package() {
    cd "$_pkgname"
    install -Dm644 "build/ja-kawaii.mo" "$pkgdir/usr/share/locale/ja_JP_kawaii/LC_MESSAGES/gcc.mo"
}
