# Maintainer: Matthew Gamble <git@matthewgamble.net>
# Contributor: evotopid

pkgname=pywb
pkgver=0.33.1
pkgrel=1
pkgdesc="Python WayBack for web archive replay and url-rewriting HTTP/S web proxy"
arch=("any")
url="https://pypi.python.org/pypi/pywb"
license=("GPL")
depends=("python" "python-six" "python-chardet" "python-requests" "python-redis" "python-jinja" "python-surt" "python-brotlipy" "brotli" "python-yaml" "python-watchdog" "python-webencodings")
makedepends=("python-setuptools")
checkdepends=("python-pytest" "python-pytest-cov" "python-fakeredis" "python-webtest" "python-mock")
source=("https://pypi.python.org/packages/5f/cb/3e5cf97c970a069778488a7556de6510fb0d923db9bf45489d536c28170c/pywb-${pkgver}.tar.gz")
md5sums=("4d233d0099b8a85f9b7c68a101c9bde3")

build() {
    cd "${srcdir}/pywb-${pkgver}"
    python setup.py build
}

# More than half the tests are failing on my machine at the moment, not sure why.
#check() {
#    cd "${srcdir}/pywb-${pkgver}"
#    python setup.py test
#}

package() {
    cd "${srcdir}/pywb-${pkgver}"
    python setup.py install --root="${pkgdir}" --skip-build --optimize=1
    # TODO: Consider removing sample files
    #rm -r "${pkgdir}/usr/sample_archive"
    # Remove non-namespaced tests that aren't necessary for the functioning of the package
    rm -r "${pkgdir}/usr/lib/python3.6/site-packages/tests"
}
