# Maintainer: Batuhan Baserdem <lastname dot firstname at gmail>
pkgname=maestral-qt
pkgver=1.0.0.dev4
pkgrel=1
pkgdesc='A Qt interface for the Maestral daemon'
arch=('any')
url="https://github.com/SamSchott/${pkgname}"
license=('MIT')
source=("${url}/archive/v${pkgver}.tar.gz")
makedepends=('python' 'python-setuptools')
depends=(
    'maestral'
    'python'
    'python-bugsnag'
    'python-click>=7.1.1'
    'python-markdown2'
    'python-packaging'
    'python-pyqt5>=5.9')
# maestral:         AUR dependency (git-version maintained by me)
# python-bugsnag:   AUR dependency (git-version maintained by me)
# python-markdown2: AUR dependency
optdepends=('gnome-shell-extension-appindicator: Gnome integration')

build() {
    cd "${srcdir}/${_name}"
    python setup.py build
}

package() {
    # Change into the source git directory
    cd "${srcdir}/${_name}"
    # Run python setup function
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
    # Install the licence
    install -Dm644 "${srcdir}/${_name}/LICENSE.txt" \
        "${pkgdir}/usr/share/licenses/${_name}/LICENSE"
}
md5sums=('5416f536d33a2eaef8fd637bc1dbb0c5')
