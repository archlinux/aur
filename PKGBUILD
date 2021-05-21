# Maintainer: Batuhan Baserdem <lastname dot firstname at gmail>
# AUR dependencies;
# maestral          (vcs or release, maintained by coxackie & me)
# python-bugsnag    (vcs, maintained by me)
# python-markdown2
pkgname=maestral-qt
pkgver=1.4.4.dev2
pkgrel=2
pkgdesc='A Qt interface for the Maestral daemon'
arch=('any')
url="https://github.com/SamSchott/${pkgname}"
license=('MIT')
source=("${url}/archive/v${pkgver}.tar.gz")
makedepends=('python' 'python-setuptools')
depends=(
    'python'
    'maestral>=1.4.3'
    'python-click>=7.1.1'
    'python-markdown2'
    'python-packaging'
    'python-pyqt5>=5.9')
optdepends=('gnome-shell-extension-appindicator: Gnome integration')
md5sums=('e418180ed8e8333722e135c26cb37bc4')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    # Run python setup function
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
    # Install the licence
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
