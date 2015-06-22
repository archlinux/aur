#
# PKGBUILD for fs-uae-launcher
#
# Contributor: Uffe Jakobsen <uffe@uffe.org>
# Maintainer: Uffe Jakobsen <uffe@uffe.org>
#
pkgname=fs-uae-launcher
pkgver=2.4.1
pkgrel=2
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
depends=("fs-uae" "python2-pyqt4" "python2-setuptools" "python2-six" "hicolor-icon-theme" "xdg-utils")
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
source=("${_pkgurl}" "remove_inbuilt_six.patch")
noextract=()

md5sums=('8c15b5198acdf6d539743b213b02eb66'
         '0360a6f6e361e7f0005031a2c5ad4e3d')
sha1sums=('caf97536b75b38ee545faf69c78418ff85cae094'
          'b41845cf265b9492ce3015e0e3d6e723902eb1bc')
sha256sums=('77a22a7a2dee7eef42fc5eb735624bf5760488df1628431e4fbc05da90ee04dd'
            '5d24b030e463fa0af42daef09bd060d8d4cf3828a248acecfcbbdd940360764f')
sha384sums=('8949e67dd62041e2c9383a494b6c7e2676b50e0d442e5af128c1ae943a6c50b6399f6958e65ab8b850ef0d60596f84a8'
            '2e1e4bcbb7c2f593e00bf2fe81e8dfc463c78efc0aa7517b11ce10d61ace96092a95b9daae34df2e71554c731a4ccb2c')
sha512sums=('b668416f3b365555fdd50ae8e4cb68335153ebe0ad96a330c8c8197344d0b79bae0eb2ecdf6da32a557ab6dafd07e7e45377ef234a509db85d370a381fb3b0d1'
            '0226114ab8ae758a15176b28a053181cda8a3f6cd23b618e86da3f58d98a733219303c02e5431bb4634592ada5a97e19ae7c0abaa84b3a24eccd16682da2b5a7')

prepare() {
  cd "${srcdir}/${_pkgname}-${_pkgver}/${_pkgsrcdir}"
}

build() {
  # Patch to remove the packaged version of python-six
  cd "${srcdir}/${_pkgname}-${_pkgver}/${_pkgsrcdir}"
  patch -N -i ../../remove_inbuilt_six.patch
  make all
}

check() {
  cd "${srcdir}/${_pkgname}-${_pkgver}/${_pkgsrcdir}"
  #make -k check
}

package() {
  cd "${srcdir}/${_pkgname}-${_pkgver}/${_pkgsrcdir}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}

# EOF
