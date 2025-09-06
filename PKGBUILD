# Maintainer: ookami <mail@ookami.one>
pkgname=proxy-ns
pkgver=2.3.7
pkgrel=1
pkgdesc="Run programs in a network namespace where all traffic go through proxy"
arch=('x86_64' 'aarch64')
url="https://github.com/OkamiW/proxy-ns"
license=('GPL')
depends=()
makedepends=('git' 'make' 'go' 'scdoc')
source=("git+$url#tag=v$pkgver")
sha512sums=('a17e669b900352db9c8fe518a1c565738ec94a68c2215f8a18772d7820d401f80e1878b4e668ba62fe232fd3d854dde2d433e5f400ea90cbe2b93ade53bffd87')
backup=('etc/proxy-ns/config.json')

build() {
    cd "$srcdir/$pkgname"
    make sysconfdir=/etc
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir" prefix=/usr sysconfdir=/etc install install-doc install-config
}
