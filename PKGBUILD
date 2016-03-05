# Contributor: Lukas Linhart <bugs@almad.net>
# Contributor: Changaco <changaco ατ changaco δοτ net>
# Contributor: Nicolas Pouillard <nicolas.pouillard@gmail.com>
# Contributor: Sean Greenslade <zootboysean@gmail.com>

pkgname=python2-rospkg
pkgver=1.0.38
pkgrel=1
pkgdesc="ROS - provides basic utilities for querying information about ROS packages, stacks, and distributions."
url="http://docs.ros.org/independent/api/rospkg/html/"
arch=('any')
license=('BSD')
depends=('python2')
makedepends=('python2-distribute')
conflicts=()
replaces=()
backup=()
source=("https://pypi.python.org/packages/source/r/rospkg/rospkg-${pkgver}.tar.gz")
sha256sums=('774b478fb7b2fe49733d40c120af785af898b838ef1a0082951351e0113b8c32')

provides=(rospkg)

build() {
  cd ${srcdir}/rospkg-${pkgver}
  find -type f -print0 | xargs -0 sed -i -e 's/#!\/usr\/bin\/env python/#!\/usr\/bin\/env python2/g'
  python2 setup.py build
}
package() {
  cd ${srcdir}/rospkg-${pkgver}
  python2 setup.py install --optimize=1 --skip-build --prefix="/usr" --root="${pkgdir}"
}
