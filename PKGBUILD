# Maintainer: OS Hazard <oshazard+aur@gmail.com>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>
# Contributor: nesl247 <nesl247@gmail.com>

_upstream="ccsm"

pkgname=(ccsm-git ccsm-gtk3-git)
pkgver=0.8.12.3.r33.gaaf97ec
pkgrel=1
pkgdesc="Compizconfig Settings Manager in Python2"
arch=('any')
url="https://github.com/compiz-reloaded/${_upstream}"
license=('GPL')
depends=("compizconfig-python-git" 'python-gobject' 'python-cairo' 'hicolor-icon-theme')
makedepends=('intltool')
optdepends=('compiz-gtk-standalone: option 1' 'compiz-core: option 2')
groups=('compiz-fusion' 'compiz-fusion-gtk' 'compiz-fusion-kde')
conflicts=('ccsm')
provides=("ccsm=$pkgver")
source=(
	"git+https://github.com/compiz-reloaded/${_upstream}.git"
)
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_upstream}"
  git describe --long --tags|sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package_ccsm-git() {
  depends+=('gtk2')
  cd "${srcdir}/${_upstream}"
  python ./setup.py install --prefix=/usr --with-gtk=2.0 --root="${pkgdir}"
}

package_ccsm-gtk3-git() {
  depends+=('gtk3')
  cd "${srcdir}/${_upstream}"
  python ./setup.py install --prefix=/usr --with-gtk=3.0 --root="${pkgdir}"
}
