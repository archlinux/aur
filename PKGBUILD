# Maintainer: OS Hazard <oshazard+aur@gmail.com>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>
# Contributor: nesl247 <nesl247@gmail.com>

_upstream="ccsm"

pkgname=ccsm-git
pkgver=0.8.12.3.0.r1.gf9cb5c3
pkgrel=1
pkgdesc="Compizconfig Settings Manager in Python2"
arch=('any')
url="https://github.com/compiz-reloaded/${_upstream}"
license=('GPL')
depends=("compizconfig-python-git" 'python2-gobject')
makedepends=('intltool')
optdepends=('compiz-gtk-standalone: option 1' 'compiz-core: option 2')
groups=('compiz-fusion' 'compiz-fusion-gtk' 'compiz-fusion-kde')
conflicts=('ccsm')
provides=("ccsm=$pkgver")
source=(
	"git+https://github.com/compiz-reloaded/${_upstream}.git"
)
install=ccsm.install
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_upstream}"
  git describe --long --tags|sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${_upstream}"
  python2 ./setup.py install --prefix=/usr --with-gtk=2.0 --root="${pkgdir}"
}
