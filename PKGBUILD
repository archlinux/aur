#
# PKGBUILD for fs-uae-launcher
#
# Contributor: Uffe Jakobsen <uffe@uffe.org>
# Maintainer: Uffe Jakobsen <uffe@uffe.org>
# Maintainer: Guilherme Calé <gui@cabritacale.eu>
#
pkgname=fs-uae-launcher
pkgver=2.8.3
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
optdepends=("p7zip: for .7z zip support" "python-lhafile: for .lha file support")
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${_pkgurl}" "remove_inbuilt_six.patch")
#source=("${_pkgurl}")
noextract=()

md5sums=('6afb73337cdeaca9339264350e4a5d17'
         '0ead6046d867517d42fb981a10d49d81')

prepare() {
  cd "${srcdir}/${_pkgname}-${_pkgver}/${_pkgsrcdir}"
}

build() {
  # Patch to remove the packaged version of python-six
  cd "${srcdir}/${_pkgname}-${_pkgver}/${_pkgsrcdir}"
  patch -N -i ../../remove_inbuilt_six.patch
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
  install -D -m644 ./share/applications/fs-uae-launcher.desktop "$pkgdir/usr/share/applications/fs-uae-launcher.desktop"
  install -D -m644 ./share/fs-uae-launcher/share-dir "$pkgdir/usr/share/fs-uae-launcher/share-dir"
  install -D -m644 ./share/icons/hicolor/16x16/apps/fs-uae-launcher.png "$pkgdir/usr/share/icons/hicolor/16x16/apps/fs-uae-launcher.png"
  install -D -m644 ./share/icons/hicolor/22x22/apps/fs-uae-launcher.png "$pkgdir/usr/share/icons/hicolor/22x22/apps/fs-uae-launcher.png"
  install -D -m644 ./share/icons/hicolor/24x24/apps/fs-uae-launcher.png "$pkgdir/usr/share/icons/hicolor/24x24/apps/fs-uae-launcher.png"
  install -D -m644 ./share/icons/hicolor/32x32/apps/fs-uae-launcher.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/fs-uae-launcher.png"
  install -D -m644 ./share/icons/hicolor/48x48/apps/fs-uae-launcher.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/fs-uae-launcher.png"
  install -D -m644 ./share/icons/hicolor/64x64/apps/fs-uae-launcher.png "$pkgdir/usr/share/icons/hicolor/64x64/apps/fs-uae-launcher.png"
  install -D -m644 ./share/icons/hicolor/128x128/apps/fs-uae-launcher.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/fs-uae-launcher.png"
  install -D -m644 ./share/icons/hicolor/256x256/apps/fs-uae-launcher.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/fs-uae-launcher.png"
}

# EOF
