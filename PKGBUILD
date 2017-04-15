# Maintainer: tuftedocelot@fastmail.fm
_pkgname=yubioath-desktop
pkgname=yubico-${_pkgname}
pkgver=4.1.0
pkgrel=1
pkgdesc="Crossplatform graphical user interface to generate one-time passwords."
arch=('i686' 'x86_64')
url="https://developers.yubico.com/yubioath-desktop/"
license=('GPL')
depends=('yubikey-manager' 'pcsclite' 'ccid' 'python-pyside' 'python-pyscard' 
'python-pbkdf2' 'python-setuptools' 'python-pyside-tools' 'python-crypto' 
'yubikey-personalization' 'python-click' 'python-pyotherside' 'qt-solutions-git')
source=("git://github.com/Yubico/yubioath-desktop.git#tag=yubioath-desktop-4.1.0")
sha256sums=('SKIP')
conflicts=('yubico-yubioath-desktop-git')

prepare() {
    cd "${srcdir}/$_pkgname"
    git submodule init
    git submodule update
}

package() {
    mkdir -p ${pkgdir}/usr/bin
	
    cd "${srcdir}/$_pkgname"
    qmake
    make

    install -D -m0755 ${srcdir}/yubioath-desktop/yubioath-desktop ${pkgdir}/usr/bin/
    mkdir -p ${pkgdir}/usr/share/applications/
    mkdir -p ${pkgdir}/usr/share/icons/
    install -D -m0644 ${srcdir}/$_pkgname/resources/yubioath.desktop ${pkgdir}/usr/share/applications/
    install -D -m0644 ${srcdir}/$_pkgname/resources/icons/yubioath.png ${pkgdir}/usr/share/icons/
}
