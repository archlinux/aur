# Maintainer: ookami <mail@ookami.one>
pkgname=proxy-ns
pkgver=2.4.0
pkgrel=1
pkgdesc="Run programs in a network namespace where all traffic go through proxy"
arch=('x86_64' 'aarch64')
url="https://github.com/OkamiW/proxy-ns"
license=('GPL')
depends=()
makedepends=('git' 'make' 'go')
source=("git+$url#tag=v$pkgver")
sha512sums=('e046aac10b843164a2b6db21f8b4b20b41af4c0641dceec0769483433194880dc0f1ffe3924e01e50297a29d1984fa024b61efcbca41357185ce3566625adc99')
backup=('etc/proxy-ns/config.json')

build() {
    cd "$srcdir/$pkgname"
    make sysconfdir=/etc
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir" prefix=/usr sysconfdir=/etc install install-doc install-config
}
