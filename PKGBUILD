# Maintainer: tuftedocelot@fastmail.fm
_pkgname=yubioath-desktop
pkgname=yubico-${_pkgname}
pkgver=5.0.0
pkgrel=1
pkgdesc="Crossplatform graphical user interface to generate one-time passwords."
arch=('x86_64')
url="https://developers.yubico.com/yubioath-desktop/"
license=('BSD')
depends=('pcsclite' 'ccid' 'python-pyotherside' 'yubikey-manager>=3.1.0' 'qt5-quickcontrols2' 'qt5-declarative')
makedepends=('swig' 'qt5-svg' 'libffi' 'openssl' 'qt5-base' 'git')
validpgpkeys=('8D0B4EBA9345254BCEC0E843514F078FF4AB24C3' # Dag Heyman <dag@yubico.com>
              '57A9DEED4C6D962A923BB691816F3ED99921835E' # Emil Lundberg <emil@yubico.com>
              )
source=("git+https://github.com/Yubico/${_pkgname}.git#tag=${_pkgname}-${pkgver}?signed")
sha256sums=('SKIP')
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
  install -D -m0644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

