# Maintainer: ookami <mail@ookami.one>
pkgname=proxy-ns
pkgver=2.4.5
pkgrel=1
pkgdesc="Run programs in a network namespace where all traffic go through proxy"
arch=('x86_64' 'aarch64')
url="https://github.com/OkamiW/proxy-ns"
license=('GPL')
depends=()
makedepends=('git' 'make' 'go')
source=("git+$url#tag=v$pkgver")
sha512sums=('4c7c7e75be38f99fc01c3e876aa25d7e2531d3cfdae2bc185b66e0b027be69e42d75115edd072e036e1113a025607ffe1512f44b3311a8ab55aa46414bccb59b')
backup=('etc/proxy-ns/config.json')

build() {
    cd "$srcdir/$pkgname"
    make sysconfdir=/etc
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir" prefix=/usr sysconfdir=/etc install install-doc install-config
}
