# Maintainer: Michael Goehler <somebody dot here at gmx dot de>
# Contributor: Timothy Redaelli <timothy dot redaelli at gmail dot com>
# Contributor: DonVla <donvla at users dot sourceforge dot net>

pkgname=python-smbus
pkgver=r6284
pkgrel=1
pkgdesc="Python wrapper for SMBus access over i2c-dev."
arch=('i686' 'x86_64' 'armv6h')
url="http://www.lm-sensors.org/wiki/I2CTools"
license=('GPL')
depends=('python' 'i2c-tools-svn')
makedepends=('python' 'subversion')
options=('!strip')
source=('python-smbus::svn+http://lm-sensors.org/svn/i2c-tools/trunk')
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "${srcdir}/${pkgname}/py-smbus"
  python setup.py clean --all
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}/py-smbus"
  python setup.py install --prefix "${pkgdir}/usr"
}

# vim:set ts=2 sw=2 et:
