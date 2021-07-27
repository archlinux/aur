# Maintainer: fordprefect <fordprefect@dukun.de>
pkgname="python-ldns"
pkgver=1.7.1
_libver=3.0.0
pkgrel=1
pkgdesc="Python bindings for the ldns library for DNS programming"
url="https://www.nlnetlabs.nl/projects/ldns/"
arch=('x86_64' 'i686')
license=('BSD')
depends=("python" "ldns" "python-ipcalc")
makedepends=("python-setuptools")
source=("https://www.nlnetlabs.nl/downloads/ldns/ldns-${pkgver}.tar.gz")
sha256sums=('8ac84c16bdca60e710eea75782356f3ac3b55680d40e1530d7cea474ac208229')

build() {
    cd "${srcdir}/ldns-$pkgver"
    ./configure --with-pyldns --prefix=/usr
    make
}

package() {
    cd ldns-$pkgver
    make DESTDIR="$pkgdir" install-pyldns
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
