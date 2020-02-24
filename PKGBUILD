# Maintainer: tuftedocelot@fastmail.fm
_pkgname=yubioath-desktop
pkgname=yubico-${_pkgname}-git
pkgver=1342
pkgrel=1
pkgdesc="Crossplatform graphical user interface to generate one-time passwords."
arch=('x86_64')
url="https://developers.yubico.com/yubioath-desktop/"
license=('BSD')
depends=('pcsclite' 'ccid' 'python-pyotherside' 'yubikey-manager>=3.1.0' 'qt5-quickcontrols2' 'qt5-declarative' 'qt5-graphicaleffects')
makedepends=('swig' 'qt5-svg' 'libffi' 'openssl' 'qt5-base' 'git')
validpgpkeys=('8D0B4EBA9345254BCEC0E843514F078FF4AB24C3' # Dag Heyman <dag@yubico.com>
              '57A9DEED4C6D962A923BB691816F3ED99921835E' # Emil Lundberg <emil@yubico.com>
              '5DE3E0509C47EA3CF04A42D34AEE18F83AFDEB23' # GitHub commit signing
              )
source=("git+https://github.com/Yubico/yubioath-desktop.git?signed")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"

    git rev-list --count HEAD
}

build() {
  cd "${_pkgname}"

  qmake-qt5 QMAKE_CFLAGS_RELEASE="${CFLAGS}" QMAKE_CXXFLAGS_RELEASE="${CXXFLAGS}" QMAKE_LFLAGS_RELEASE="${LDFLAGS}"
  make
}

package() {
  cd "${_pkgname}"

  make INSTALL_ROOT="${pkgdir}/" install
  install -D -m0644 resources/com.yubico.yubioath.desktop "${pkgdir}/usr/share/applications/yubioath-desktop.desktop"
  install -D -m0644 resources/icons/com.yubico.yubioath.png "${pkgdir}/usr/share/pixmaps/com.yubico.yubioath.png"
  install -D -m0644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

