# Maintainer:	Batuhan Baserdem <lastname dot firstname at gmail>

# AUR dependencies (*: I maintain, +: I co-maintain)
#+python-dbus-next
name=desktop-notifier
pkgname="python-${name}"
provides=("${pkgname}")
pkgver=3.2.3
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
md5sums=('a7713fed3bf275d47cf335a34370fec8')

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
