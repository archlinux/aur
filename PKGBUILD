# Maintainer: tuftedocelot@fastmail.fm
_pkgname=yubioath-desktop
pkgname=yubico-${_pkgname}
pkgver=4.3.3
pkgrel=1
pkgdesc="Crossplatform graphical user interface to generate one-time passwords."
arch=('x86_64')
url="https://developers.yubico.com/yubioath-desktop/"
license=('BSD')
depends=('pcsclite' 'ccid' 'python-pyotherside' 'yubikey-manager>=0.6.0' 'qt5-quickcontrols')
makedepends=('swig' 'qt5-svg' 'libffi' 'openssl' 'qt5-base')
validpgpkeys=('8D0B4EBA9345254BCEC0E843514F078FF4AB24C3' # Dag Heyman <dag@yubico.com>
              '57A9DEED4C6D962A923BB691816F3ED99921835E' # Emil Lundberg <emil@yubico.com>
              )
source=("https://github.com/Yubico/${_pkgname}/releases/download/${_pkgname}-${pkgver}/${_pkgname}-${pkgver}.tar.gz"{,.sig})
sha256sums=('fec3bacf05470dc119b4ec4c077ed13b49c9052baffd98dbcd9a3f05635b0aa8'
            'SKIP')
conflicts=('yubico-yubioath-desktop-git')

build() {
  cd "${_pkgname}-${pkgver}"

  qmake-qt5 QMAKE_CFLAGS_RELEASE="${CFLAGS}" QMAKE_CXXFLAGS_RELEASE="${CXXFLAGS}" QMAKE_LFLAGS_RELEASE="${LDFLAGS}"
  make
}

package() {
  cd "${_pkgname}-${pkgver}"

  make INSTALL_ROOT="${pkgdir}/" install
  install -D -m0644 resources/yubioath-desktop.desktop "${pkgdir}/usr/share/applications/yubioath-desktop.desktop"
  install -D -m0644 resources/icons/yubioath.png "${pkgdir}/usr/share/pixmaps/yubioath.png"
}
