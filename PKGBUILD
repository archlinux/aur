# Maintainer: OS Hazard <oshazard+aur@gmail.com>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>
# Contributor: nesl247 <nesl247@gmail.com>

_upstream="ccsm"

pkgname=ccsm-git
pkgver=0.8.12.3.r10.g4b29da9
pkgrel=2
pkgdesc="Compizconfig Settings Manager in Python2"
arch=('any')
url="https://github.com/compiz-reloaded/${_upstream}"
license=('GPL')
depends=("compizconfig-python-git" 'python-gobject' 'python-cairo')
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
  python ./setup.py install --prefix=/usr --with-gtk=2.0 --root="${pkgdir}"
}
