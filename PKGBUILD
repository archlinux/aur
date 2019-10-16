# Maintainer: S garnica < swhaat at github >
# Contributor: Will Price <will.price94+aur@gmail.com>
# Contributor: Brice Waegeneire <bricewge at gmail dot com>

pkgname=platformio-git
_pkgname=platformio-core
pkgver=v4.0.3.r97.ga481a5de
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
         'python-lockfile'
         'python-pyserial'
         'python-requests'
         'python-tabulate'
         'python-semantic-version')
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
    cd "$srcdir/${_pkgname}"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
