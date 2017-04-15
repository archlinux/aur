# Maintainer: tuftedocelot@fastmail.fm
_pkgname=yubioath-desktop
pkgname=yubico-${_pkgname}-git
pkgver=636
pkgrel=1
pkgdesc="Crossplatform graphical user interface to generate one-time passwords."
arch=('i686' 'x86_64')
url="https://developers.yubico.com/yubioath-desktop/"
license=('GPL')
depends=('yubikey-manager' 'pcsclite' 'ccid' 'python-pyside' 'python-pyscard' 
'python-pbkdf2' 'python-setuptools' 'python-pyside-tools' 'python-crypto' 
'yubikey-personalization' 'python-click' 'qt-solutions-git' 'python-pyotherside')
makedepends=('git')
source=("git+https://github.com/Yubico/yubioath-desktop.git")
md5sums=('SKIP')

pkgver() {
	cd ${_pkgname}
    git rev-list --count HEAD
}

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

    install -D -m0755 ${srcdir}/$_pkgname/$_pkgname ${pkgdir}/usr/bin/
    mkdir -p ${pkgdir}/usr/share/applications/
    mkdir -p ${pkgdir}/usr/share/icons
    install -D -m0644 ${srcdir}/yubioath-desktop/resources/yubioath.desktop ${pkgdir}/usr/share/applications/
    install -D -m0644 ${srcdir}/yubioath-desktop/resources/icons/yubioath.png ${pkgdir}/usr/share/icons/
}
