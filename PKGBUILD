# Maintainer: ookami <mail@ookami.one>
pkgname=proxy-ns
pkgver=2.4.3
pkgrel=1
pkgdesc="Run programs in a network namespace where all traffic go through proxy"
arch=('x86_64' 'aarch64')
url="https://github.com/OkamiW/proxy-ns"
license=('GPL')
depends=()
makedepends=('git' 'make' 'go')
source=("git+$url#tag=v$pkgver")
sha512sums=('a767ff65c78b4fb404bc12f5e6ba66b7d9c1e14f1409e84dcaa0e01ecb1a2b65ae513e7d7e2cfc95abc22c56e9ed149d12c546a3f0c0a7593c54f7b62b42dcd6')
backup=('etc/proxy-ns/config.json')

build() {
    cd "$srcdir/$pkgname"
    make sysconfdir=/etc
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir" prefix=/usr sysconfdir=/etc install install-doc install-config
}
