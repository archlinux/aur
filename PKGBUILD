# Maintainer : Sapphira Armageddos <shadowkyogre.public@gmail.com>
# Contributor: OS Hazard <oshazard+aur@gmail.com>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>
# Contributor: nesl247 <nesl247@gmail.com>

_upstream="ccsm"
_pkgver=0.8.14
_micro=""

pkgname=ccsm
pkgver="${_pkgver}${_micro}"
pkgrel=3
pkgdesc="Compizconfig Settings Manager in Python2"
arch=('any')
url="https://gitlab.com/compiz/${_upstream}/"
license=('GPL')
depends=('compizconfig-python' 'python-gobject' 'python-cairo' 'gtk2')
makedepends=('intltool')
optdepends=('compiz-gtk-standalone: option 1' 'compiz-core: option 2')
groups=('compiz-fusion')
conflicts=('ccsm-git')
provides=("ccsm=$pkgver")
source=(
	"${url}-/archive/v${pkgver}/${_upstream}-v${pkgver}.tar.bz2"
	"bindings-regression-workaround.patch"
)

prepare() {
  cd "${srcdir}/${_upstream}-v${pkgver}"
  patch -Np1 -i "${srcdir}/bindings-regression-workaround.patch"
}

package() {
  cd "${srcdir}/${_upstream}-v${pkgver}"
  python ./setup.py install --prefix=/usr --with-gtk=2.0 --root="${pkgdir}"
}

sha256sums=('63d8a672a63dfda05a556ec1b5df0b9406602b82825d2910f8870bf1cb3300d8'
            'a71ca356c239a0e88a91bf05f975fd3dd92801beb6bb16d3e69b1b318fdf5ee0')
