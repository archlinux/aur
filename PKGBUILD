# Maintainer: ookami <mail@ookami.one>
pkgname=proxy-ns
pkgver=2.4.2
pkgrel=1
pkgdesc="Run programs in a network namespace where all traffic go through proxy"
arch=('x86_64' 'aarch64')
url="https://github.com/OkamiW/proxy-ns"
license=('GPL')
depends=()
makedepends=('git' 'make' 'go')
source=("git+$url#tag=v$pkgver")
sha512sums=('364cd3d83816557f93fb82c432f9a0486162bde0f70fac97e4c4fe55013647047c30d43cf05e0874df1f276ee3f49353575c09dd4b144665d76447d7fcb2c3d0')
backup=('etc/proxy-ns/config.json')

build() {
    cd "$srcdir/$pkgname"
    make sysconfdir=/etc
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir" prefix=/usr sysconfdir=/etc install install-doc install-config
}
