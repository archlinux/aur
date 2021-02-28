# Maintainer:	Batuhan Baserdem <lastname dot firstname at gmail>

# AUR dependencies (*: I maintain, +: I co-maintain)
#+python-dbus-next
name=desktop-notifier
pkgname="python-${name}"
provides=("${pkgname}")
pkgver=3.2.2
pkgrel=1
pkgdesc='Python library for cross-platform desktop notifications'
arch=('x86_64')
url="https://github.com/SamSchott/${name}"
license=('MIT')
source=("${url}/archive/v${pkgver}.tar.gz")
makedepends=('python-setuptools')
depends=(
    'python'
    'python-dbus-next'
    'python-packaging'
    'python-wheel')
md5sums=('7391be4aeb4b97bdeaac7a2904153357')

build() {
    cd "${srcdir}/${name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${name}-${pkgver}"
    # Run python setup function
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
    # Install the licence
    install -Dm644 "${srcdir}/${name}-${pkgver}/LICENSE" \
    	"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
