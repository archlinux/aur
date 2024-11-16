# Maintainer: Erik Bročko (OM2LT) <erik@brocko.eu>

pkgname=soapyrtltcp-git
pkgver=r2.3422042
pkgrel=1
pkgdesc="SoapySDR module to emulate RTL TCP protocol"
arch=('any')
url="https://github.com/pothosware/SoapyRTLTCP"
license=('MIT')
depends=('soapysdr')
makedepends=('git' 'cmake')
provides=('soapyrtltcp')
conflicts=('soapyrtltcp')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$pkgname"
    cmake -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev
    make -C build
}

package() {
    make -C "$srcdir/$pkgname/build" DESTDIR="$pkgdir" install
}
