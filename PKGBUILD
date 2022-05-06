# Maintainer: xiretza <xiretza+aur@xiretza.xyz>
# Contributor: Michal Krenek (Mikos) <m.krenek@gmail.com>

_pkgname=libmirisdr-4
pkgname=libmirisdr4-v1
pkgver=1.1.2
pkgrel=1
pkgdesc="Support of Mirics MSi001 + MSi2500 SDR devices (yet another flavour of libmirisdr) (version 1.x)"
arch=('i686' 'x86_64')
url="https://github.com/f4exb/$_pkgname"
license=('GPL')
depends=('libusb>=1.0')
makedepends=('git' 'cmake')
provides=('libmirisdr' "libmirisdr4=$pkgver")
conflicts=('libmirisdr' 'libmirisdr4' 'libmirisdr-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f86763ec35b6d76a9488f36d0e0cdc7c909d85623687e93dae95132bcaef5e5d')

build() {
    cd "$_pkgname-$pkgver"

    cmake . \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "$_pkgname-$pkgver"

    make DESTDIR="$pkgdir/" install
    install -Dm644 mirisdr.rules "${pkgdir}/etc/udev/rules.d/99-mirisdr.rules"
}
