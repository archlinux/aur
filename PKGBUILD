# Maintainer: tuftedocelot@fastmail.fm
_pkgname=yubioath-desktop
pkgname=yubico-${_pkgname}
pkgver=4.3.3
pkgrel=1
_tag="${_pkgname}-${pkgver}"
pkgdesc="Crossplatform graphical user interface to generate one-time passwords."
arch=('i686' 'x86_64')
url="https://developers.yubico.com/yubioath-desktop/"
license=('GPL')
depends=('pcsclite' 'ccid' 'python-pyotherside' 'yubikey-manager' 'qt5-quickcontrols')
makedepends=('swig' 'git')
validpgpkeys=('8D0B4EBA9345254BCEC0E843514F078FF4AB24C3') # Dag Heyman <dag@yubico.com>
source=("https://github.com/Yubico/${_pkgname}/releases/download/${_pkgname}-${pkgver}/${_pkgname}-${pkgver}.tar.gz"{,.sig})
md5sums=('942480b432f3985b5ba9b57c928936dc'
         'SKIP')
conflicts=('yubico-yubioath-desktop-git')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  qmake-qt5 QMAKE_CFLAGS_RELEASE="${CFLAGS}" QMAKE_CXXFLAGS_RELEASE="${CXXFLAGS}" QMAKE_LFLAGS_RELEASE="${LDFLAGS}"
  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  make INSTALL_ROOT="${pkgdir}/" install
  install -D -m0644 resources/yubioath.desktop "${pkgdir}/usr/share/applications/yubioath.desktop"
  install -D -m0644 resources/icons/yubioath.png "${pkgdir}/usr/share/pixmaps/yubioath.png"
}
