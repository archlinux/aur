# Maintainer: ookami <mail@ookami.one>
pkgname=proxy-ns
pkgver=2.4.4
pkgrel=1
pkgdesc="Run programs in a network namespace where all traffic go through proxy"
arch=('x86_64' 'aarch64')
url="https://github.com/OkamiW/proxy-ns"
license=('GPL')
depends=()
makedepends=('git' 'make' 'go')
source=("git+$url#tag=v$pkgver")
sha512sums=('775f8b8ac9c50b4895b25991fbb7c8c9762ee13f957f5d35ca8f230365e98a0272eff7be0e6895d85bec341788cf8bafc6abd6afed9e923ad61e4ff2098f61ff')
backup=('etc/proxy-ns/config.json')

build() {
    cd "$srcdir/$pkgname"
    make sysconfdir=/etc
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir" prefix=/usr sysconfdir=/etc install install-doc install-config
}
