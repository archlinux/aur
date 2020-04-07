# Maintainer: Batuhan Baserdem <lastname dot firstname at gmail>

_name=maestral-qt

pkgname="${_name}-git"
provides=("${_name}")
conflicts=("${_name}")
pkgver=0.6.4.r0.g28c4c50
pkgrel=1
pkgdesc='A Qt interface for the Maestral daemon'
arch=('any')
url="https://github.com/SamSchott/${_name}"
license=('MIT')
source=("git+${url}")
makedepends=('git' 'python' 'python-setuptools')
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
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_name}"
    git describe --long --tags | sed 's|\([^-]*-g\)|r\1|;s|-|.|g;s|^v||g'
}

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
