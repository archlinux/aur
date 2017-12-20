# Maintainer: tuftedocelot@fastmail.fm
_pkgname=yubioath-desktop
pkgname=yubico-${_pkgname}
pkgver=4.3.2
pkgrel=1
pkgdesc="Crossplatform graphical user interface to generate one-time passwords."
arch=('x86_64')
url="https://developers.yubico.com/yubioath-desktop/"
license=('BSD')
depends=('pcsclite' 'ccid' 'python-pyotherside' 'yubikey-manager' 'qt5-quickcontrols')
makedepends=('swig' 'qt5-svg' 'libffi' 'openssl' 'qt5-base')
validpgpkeys=('8D0B4EBA9345254BCEC0E843514F078FF4AB24C3' # Dag Heyman <dag@yubico.com>
              '57A9DEED4C6D962A923BB691816F3ED99921835E' # Emil Lundberg <emil@yubico.com>
              )
source=("https://github.com/Yubico/${_pkgname}/releases/download/${_pkgname}-${pkgver}/${_pkgname}-${pkgver}.tar.gz"{,.sig})
sha256sums=('4119a89af48495498a62623404d663835555e0d24fe76409d949e40d4aa141e9'
            'SKIP')
conflicts=('yubico-yubioath-desktop-git')

build() {
  cd "${_pkgname}"

  qmake-qt5 QMAKE_CFLAGS_RELEASE="${CFLAGS}" QMAKE_CXXFLAGS_RELEASE="${CXXFLAGS}" QMAKE_LFLAGS_RELEASE="${LDFLAGS}"
  make
}

package() {
  cd "${_pkgname}"

  make INSTALL_ROOT="${pkgdir}/" install
  install -D -m0644 resources/yubioath-desktop.desktop "${pkgdir}/usr/share/applications/yubioath-desktop.desktop"
  install -D -m0644 resources/icons/yubioath.png "${pkgdir}/usr/share/pixmaps/yubioath.png"
}
