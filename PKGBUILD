# Maintainer: OS Hazard <oshazard+aur@gmail.com>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>
# Contributor: nesl247 <nesl247@gmail.com>

_upstream="ccsm"

pkgname=ccsm-gtk3-git
pkgver=0.8.14.r62.gfdab018
pkgrel=1
pkgdesc="Compizconfig Settings Manager in Python (GTK+3 version)"
arch=('any')
url="https://gitlab.com/compiz/${_upstream}"
license=('GPL')
depends=("compizconfig-python-git" 'python-gobject' 'python-cairo' 'hicolor-icon-theme' 'gtk3')
makedepends=('intltool')
optdepends=('compiz-gtk-standalone: option 1' 'compiz-core: option 2')
groups=('compiz-fusion' 'compiz-fusion-gtk' 'compiz-fusion-kde')
conflicts=('ccsm')
provides=("ccsm=$pkgver")
source=(
	"git+https://gitlab.com/compiz/${_upstream}.git"
)
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_upstream}"
  git describe --long --tags|sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${_upstream}"
  python ./setup.py install --prefix=/usr --with-gtk=3.0 --root="${pkgdir}"
}
