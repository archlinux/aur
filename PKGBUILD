# Maintainer: fordprefect <fordprefect@dukun.de>
pkgname="python-ldns"
pkgver=1.6.17
pkgrel=1
pkgdesc="Python bindings for the ldns library for DNS programming"
url="https://www.nlnetlabs.nl/projects/ldns/"
arch=('x86_64' 'i686')
license=('BSD')
depends=("python" "ldns" "python-ipcalc")
makedepends=("python-setuptools")
source=("https://www.nlnetlabs.nl/downloads/ldns/ldns-1.6.17.tar.gz" "setup.py")
md5sums=('a79423bcc4129e6d59b616b1cae11e5e'
         '4a96c66b37f26b6d5231c6466cd6503f')

build() {
    cd "${srcdir}/ldns-$pkgver"
    ./configure --with-pyldns
    make
}

package() {
    cd "${srcdir}"
    cp ldns-$pkgver/contrib/python/ldns.py .
    python setup.py install --root="${pkgdir}" --optimize=1
    install -D ldns-$pkgver/.libs/_ldns.so.$pkgver "${pkgdir}/usr/lib/python3.5/site-packages/_ldns.so.$pkgver"
    ln -s _ldns.so.$pkgver "${pkgdir}/usr/lib/python3.5/site-packages/_ldns.so"
}
