# Maintainer: S garnica < swhaat at github >
# Contributor: Will Price <will.price94+aur@gmail.com>
# Contributor: Brice Waegeneire <bricewge at gmail dot com>

pkgname=platformio-git
_pkgname=platformio-core
pkgver=v6.1.11.r20.gb238c55e
pkgrel=1
pkgdesc="A cross-platform code builder and library manager"
arch=('any')
url="http://platformio.org/"
license=('GPL')
provides=('platformio')
depends=(
  'python'
  'python-bottle'
  'python-click'
  'python-colorama'
  'python-pyserial'
  'python-requests'
  'python-semantic-version'
  'python-tabulate'
  'python-pyelftools'
  'python-marshmallow'
  'python-zeroconf'
  'python-aiofiles'
  'python-ajsonrpc'
  'python-starlette'
  'python-wsproto'
  'uvicorn'
)
optdepends=('energia: For MSP430 based projects'
            'arduino: For Arduino based projects'
	'platformio-core-udev: Udev rules for PlatformIO supported boards/devices'
	'python-click-completion: for shell completions'
	'python-shellingham: for shell completions'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
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

    install -Dm644 "${srcdir}/${_pkgname}/build/lib/platformio/assets/system/99-platformio-udev.rules" \
		"${pkgdir}/etc/udev/rules.d/99-platformio-udev.rules"
}
