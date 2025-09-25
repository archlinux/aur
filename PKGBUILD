# Maintainer: ookami <mail@ookami.one>
pkgname=proxy-ns
pkgver=2.3.8
pkgrel=1
pkgdesc="Run programs in a network namespace where all traffic go through proxy"
arch=('x86_64' 'aarch64')
url="https://github.com/OkamiW/proxy-ns"
license=('GPL')
depends=()
makedepends=('git' 'make' 'go' 'scdoc')
source=("git+$url#tag=v$pkgver")
sha512sums=('2320fb62a71c834bac6ac581b0ef6a6b036a5ae7ac0f4204f6702a20050b7fc0168c6216ae12752e681dd191f0b989855e17c541f737f61d374fe804fbc901a2')
backup=('etc/proxy-ns/config.json')

build() {
    cd "$srcdir/$pkgname"
    make sysconfdir=/etc
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir" prefix=/usr sysconfdir=/etc install install-doc install-config
}
