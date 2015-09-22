# Maintainer: Dylan Whichard <dylan at whichard dot com>
# Contributor: Michael Goehler <somebody dot here at gmx dot de>
# Contributor: Timothy Redaelli <timothy dot redaelli at gmail dot com>
# Contributor: DonVla <donvla at users dot sourceforge dot net>

pkgname=python-smbus-git
_pkgname=python-smbus
pkgver=r290.9726bed
pkgrel=1
pkgdesc="Python wrapper for SMBus access over i2c-dev."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://www.lm-sensors.org/wiki/I2CTools"
license=('GPL')
depends=('python' 'i2c-tools-git')
makedepends=('python' 'git')
provides=('python-smbus')
conflicts=('python-smbus')
options=('!strip')
source=('python-smbus::git+https://github.com/groeck/i2c-tools.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}/py-smbus"
  python setup.py clean --all
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}/py-smbus"
  python setup.py install --prefix "${pkgdir}/usr"
}

# vim:set ts=2 sw=2 et:
