# Maintainer: ookami <mail@ookami.one>
pkgname=proxy-ns
pkgver=2.3.9
pkgrel=1
pkgdesc="Run programs in a network namespace where all traffic go through proxy"
arch=('x86_64' 'aarch64')
url="https://github.com/OkamiW/proxy-ns"
license=('GPL')
depends=()
makedepends=('git' 'make' 'go' 'scdoc')
source=("git+$url#tag=v$pkgver")
sha512sums=('60a4f77b3fba34fe23d53df25d4f866e026c996fc0337ebd3a10d844290c3b36c9ecb0272ec84dff2387ca1b10e446515dbfbf8ab30c214ec1617eb29faaf3cf')
backup=('etc/proxy-ns/config.json')

build() {
    cd "$srcdir/$pkgname"
    make sysconfdir=/etc
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir" prefix=/usr sysconfdir=/etc install install-doc install-config
}
