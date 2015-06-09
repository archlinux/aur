# Maintainer: Jiachen Yang <farseerfc@gmail.com>
# Contributor: Llumex03
# Maintainer in Chakra: gnastyle
# Contributor in Chakra: FranzMari from Chakra
# Contributor in Chakra: danyf90 <daniele.formihelli@gmail.com>
# Contributor in Chakra: totoloco <totoloco@gmx.com>

pkgname=cutegram
_pkgname=Cutegram
pkgver=2.4.0
pkgrel=1
pkgdesc="A different telegram client from Aseman team"
arch=('i686' 'x86_64')
url="http://aseman.co/en/products/cutegram/"
license=('GPL')
depends=('qt5-base' 'qt5-declarative' 'qt5-multimedia' 'qt5-quick1'
'qt5-graphicaleffects' 'qt5-quickcontrols' 'qt5-webengine' 'qt5-imageformats'
'gstreamer0.10-base-plugins' 'gstreamer0.10-good-plugins'
'libqtelegram-ae>=1:4.1')
conflicts=('cutegram-git' 'sigram-git' 'sigram' 'cutegram')
provides=('cutegram')
replaces=('cutegram-cn')

source=("https://github.com/Aseman-Land/Cutegram/archive/v$pkgver-stable.tar.gz")

sha256sums=('ddc0013f560f7b3ec01f60af8389bc1f55f1ac3ca36301d318c58057a3a60659')

prepare() {
  cd "${srcdir}/${_pkgname}-$pkgver-stable"
  mkdir -p build 
}

build() {
  cd "${srcdir}/${_pkgname}-$pkgver-stable/build"
  qmake-qt5 -r .. PREFIX=/usr DEFINES+=WEBENGINE_ASEMAN_WEBGRABBER
  make
}

package() {
  cd "${srcdir}/${_pkgname}-$pkgver-stable/build"
  make INSTALL_ROOT="${pkgdir}" install
}
