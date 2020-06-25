# Maintainer: S garnica < swhaat at github >
# Contributor: Will Price <will.price94+aur@gmail.com>
# Contributor: Brice Waegeneire <bricewge at gmail dot com>

pkgname=platformio-git
_pkgname=platformio-core
pkgver=v4.3.4.r85.g7bc22353
pkgrel=1
pkgdesc="A cross-platform code builder and library manager"
arch=('any')
url="http://platformio.org/"
license=('GPL')
provides=('platformio')
depends=('python-setuptools'
         'python-bottle'
         'python-click'
         'python-colorama'
         'python-pyserial'
         'python-requests'
         'python-semantic-version'
         'python-tabulate'
         'python-pyelftools'
         'python-marshmallow')
optdepends=('energia: For MSP430 based projects'
            'arduino: For Arduino based projects')
makedepends=('git')
source=('git+https://github.com/platformio/platformio-core.git')
md5sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build()
{
   cd "${srcdir}/${_pkgname}"
   python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}"
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build

    install -Dm644 "${srcdir}/${_pkgname}/scripts/99-platformio-udev.rules" \
		"${pkgdir}/etc/udev/rules.d/99-platformio-udev.rules"
}
