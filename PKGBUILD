# Contributor: Michael Goehler <somebody dot here at gmx dot de>
# Contributor: Timothy Redaelli <timothy dot redaelli at gmail dot com>
# Contributor: DonVla <donvla at users dot sourceforge dot net>

pkgname=python2-smbus
_pkgname=python2-smbus
pkgver=r328.22939a7
pkgrel=1
pkgdesc="Python wrapper for SMBus access over i2c-dev."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://git.kernel.org/pub/scm/utils/i2c-tools/i2c-tools.git/about/"
license=('GPL')
depends=('python2' 'i2c-tools-git')
makedepends=('python2' 'git')
provides=($_pkgname)
conflicts=($_pkgname)
options=('!strip')
source=('git+https://git.kernel.org/pub/scm/utils/i2c-tools/i2c-tools.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/i2c-tools"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/i2c-tools/py-smbus"
  python2 setup.py clean --all
  python2 setup.py build
}

package() {
  cd "${srcdir}/i2c-tools/py-smbus"
  python2 setup.py install --prefix "${pkgdir}/usr"
}

# vim:set ts=2 sw=2 et: