# Maintainer: S garnica < swhaat at github >
# Contributor: Will Price <will.price94+aur@gmail.com>
# Contributor: Brice Waegeneire <bricewge at gmail dot com>

pkgname=platformio-git
_pkgname=platformio-core
pkgver=v3.6.4.r31.g31d4706a
pkgrel=1
pkgdesc="A cross-platform code builder and library manager"
arch=('any')
url="http://platformio.org/"
license=('GPL')
depends=('python-setuptools'
         'python-arrow'
         'python-bottle'
         'python-click-5.1'
         'python-colorama'
         'python-lockfile'
         'python-pyserial'
         'python-requests'
         'python-semantic-version')
optdepends=('energia: For MSP430 based projects'
            'arduino: For Arduino based projects')
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
