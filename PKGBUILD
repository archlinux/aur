# Maintainer:	Ben Buhse <dotboy at firstnamelastname dot com>

_name=dotboy

pkgname="python-${_name}"
provides=()
conflicts=()
pkgver=0.2.1
pkgrel=1
pkgdesc='A Python script to help with dot file management'
arch=('any')
url="https://gitlab.com/bwbuhse/${_name}"
license=('MIT')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
makedepends=('python-setuptools')
depends=('python>=3.8')
md5sums=('b867cc1dff1201cdeb94fec1ff1d7390')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"

    # Run python setup function
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build

    cd "../.."
    # Install the licence
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_name}/LICENSE"
}

