# Maintainer: Alad Wenter <https://github.com/AladW>
pkgname=aurutils
pkgver=3.2.0
pkgrel=2
pkgdesc='helper tools for the arch user repository'
url='https://github.com/AladW/aurutils'
arch=('any')
license=('custom:ISC')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
	"fix-version.patch::$url/commit/483e6636c079f12b72287a7e32c68836e977d508.patch")
changelog=aurutils.changelog
install=aurutils.install
sha256sums=('60214a21a05b2dfe5f9e14b58a0c8beacc1a82841022956d60ac29e77f5e21da'
            '5576d1e3db0b4111caa55e460e923b0f43a2d6d544a2b2e7654ef7abc797e59d')
depends=('git' 'jq' 'pacutils' 'curl' 'expect')
optdepends=('bash-completion: bash completion'
            'zsh: zsh completion'
            'devtools: aur-chroot'
            'vifm: default pager')

prepare() {
    cd "$pkgname-$pkgver"
    patch -p1 < "$srcdir"/fix-version.patch
}

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
