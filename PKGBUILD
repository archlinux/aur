# Maintainer: ookami <mail@ookami.one>
pkgname=proxy-ns
pkgver=2.4.1
pkgrel=1
pkgdesc="Run programs in a network namespace where all traffic go through proxy"
arch=('x86_64' 'aarch64')
url="https://github.com/OkamiW/proxy-ns"
license=('GPL')
depends=()
makedepends=('git' 'make' 'go')
source=("git+$url#tag=v$pkgver")
sha512sums=('9a68986512fcd3696f987033748bd3ef9e103bbdfea7d37762cb5a3644c7f3a064c202307bd551e4241aa47c16e3f0b7d7f2314cd4272be8ef5deaaaf8cda0ef')
backup=('etc/proxy-ns/config.json')

build() {
    cd "$srcdir/$pkgname"
    make sysconfdir=/etc
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir" prefix=/usr sysconfdir=/etc install install-doc install-config
}
