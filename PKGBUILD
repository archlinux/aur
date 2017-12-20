# Maintainer: Jiachen Yang <farseerfc@gmail.com>
# Contributor: Llumex03
# Maintainer in Chakra: gnastyle
# Contributor in Chakra: FranzMari from Chakra
# Contributor in Chakra: danyf90 <daniele.formihelli@gmail.com>
# Contributor in Chakra: totoloco <totoloco@gmx.com>

pkgname=cutegram
_pkgname=Cutegram
pkgver=2.7.1
pkgrel=4
pkgdesc="A different telegram client from Aseman team"
arch=('i686' 'x86_64')
url="http://aseman.co/en/products/cutegram/"
license=('GPL')
depends=('qt5-imageformats' 'qt5-webkit' 'telegramqml>=0.9.1' 'libqtelegram-ae>=3:6.1')
optdepends=('gst-plugins-bad: audio support'
'gst-plugins-good: audio and notification sound')
makedepends=('git')
conflicts=('cutegram-git' 'sigram-git' 'sigram' 'cutegram')
provides=('cutegram')
replaces=('cutegram-cn')

source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/Aseman-Land/Cutegram/archive/v${pkgver}-stable.tar.gz"
    "asemantools"::"git+https://github.com/Aseman-Land/aseman-qt-tools.git#commit=91bf14b790c749bcaaddb09a8124ef6415a93906")

sha256sums=('f1cfc6bd3a1d33c2348f23ea43d923419b33576059791a071f2780db11059cf4'
            'SKIP')

prepare() {
  cd "${srcdir}/${_pkgname}-$pkgver-stable"
  git clone $srcdir/asemantools Cutegram/asemantools
  mkdir -p build
}

build() {
  cd "${srcdir}/${_pkgname}-$pkgver-stable/build"
  qmake-qt5 -r .. PREFIX=/usr QMAKE_CFLAGS_ISYSTEM=
  make
}

package() {
  cd "${srcdir}/${_pkgname}-$pkgver-stable/build"
  make INSTALL_ROOT="${pkgdir}" install
}
