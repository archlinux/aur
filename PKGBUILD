#
# PKGBUILD for fs-uae-launcher
#
# Contributor: Uffe Jakobsen <uffe@uffe.org>
# Maintainer: Uffe Jakobsen <uffe@uffe.org>
#
pkgname=fs-uae-launcher
pkgver=2.6.1
pkgrel=1
epoch=
pkgdesc=""
arch=('any')
url=http://fs-uae.net/launcher
_pkgname=${pkgname}
_pkgver=${pkgver}
_pkgsrcdir=
_pkgurl="http://fs-uae.net/fs-uae/stable/${_pkgver}/${_pkgname}-${_pkgver}.tar.gz"
license=('GPL2')
groups=()
license=("GPL2")
#depends=("fs-uae" "python2-pyqt4" "python2-setuptools" "python2-six" "hicolor-icon-theme" "xdg-utils")
depends=("fs-uae" "python-pyqt5" "python-setuptools" "python-six" "hicolor-icon-theme" "xdg-utils")
makedepends=()
checkdepends=()
optdepends=("p7zip: for .7z zip support")
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
#source=("${_pkgurl}" "remove_inbuilt_six.patch")
source=("${_pkgurl}")
noextract=()

md5sums=('aeb532082306c6887a7e4d0e7fceca7e')
sha1sums=('c962ae11e1ca7a4c6069a074d759ab4db69e42ab')
sha256sums=('47cdfe7a3cb1e8ae667c28e697d05c3a797b38a7e86759c789a2e9a3765ed470')
sha384sums=('801f05c42f5b424d11cde5db346b7760f8ce39ad57bb43fe9fbb93e49be58e8d07e104fbddbbe0491ef418864bc618ab')
sha512sums=('e4ea70afccb88efc33ac0d2527827db1f17921d86c5ca7691b11440ad78bb993f9a0d172650dd0b995cbdfb025dddbc101223016a899b27ea4a704702f167178')

prepare() {
  cd "${srcdir}/${_pkgname}-${_pkgver}/${_pkgsrcdir}"
}

build() {
  # Patch to remove the packaged version of python-six
  cd "${srcdir}/${_pkgname}-${_pkgver}/${_pkgsrcdir}"
  #patch -N -i ../../remove_inbuilt_six.patch
  patch -N -i ../../fs-uae-launcher.patch
  make all
}

check() {
  cd "${srcdir}/${_pkgname}-${_pkgver}/${_pkgsrcdir}"
  #make -k check
}

package() {
  cd "${srcdir}/${_pkgname}-${_pkgver}/${_pkgsrcdir}"
  python3 setup.py install --root="${pkgdir}/" --install-lib=/usr/share/fs-uae-launcher --optimize=1
}

# EOF
