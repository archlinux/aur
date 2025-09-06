# Maintainer: ookami <mail@ookami.one>
pkgname=proxy-ns
pkgver=2.3.6
pkgrel=1
pkgdesc="Run programs in a network namespace where all traffic go through proxy"
arch=('x86_64' 'aarch64')
url="https://github.com/OkamiW/proxy-ns"
license=('GPL')
depends=()
makedepends=('git' 'make' 'go' 'scdoc')
source=("git+$url#tag=v$pkgver")
sha512sums=('1500cfe0f465154c10ef7cc57a9749a654949727cc1b70aa4fe8d0ebf18e0a862566d3d941286a9331b131d5a789a2f9db1f16104fcea9a5d944f4934b9ff5b6')
backup=('etc/proxy-ns/config.json')

build() {
    cd "$srcdir/$pkgname"
    make sysconfdir=/etc
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir" prefix=/usr sysconfdir=/etc install install-doc install-config
}
