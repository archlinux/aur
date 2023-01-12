# Maintainer: terratrembel silvano.cortesi at hotmail dot com

_gitname='FreeSSM'
_name='freessm'
_gitcommit='97576c0'
pkgname="${_name}-git"
pkgver="${_gitcommit}"
pkgrel=1
pkgdesc="Diagnostic and adjustment tool for SUBARU® vehicles"
arch=('x86_64' 'i686i')
url="https://github.com/Comer352L/FreeSSM"
license=('GPL3')
depends=('qt5-base')
makedepends=('qt5-tools' 'make' 'gcc' 'git')
conflicts=("${_gitname}")
provides=("${_gitname}")
source=("${_gitname}::git+https://github.com/Comer352L/${_gitname}.git#commit=${_gitcommit}")
md5sums=('SKIP')

build() {
    cd "${srcdir}/${_gitname}"
    qmake-qt5 "INSTALLDIR=${pkgdir}/opt/${_gitname}"
    make release    
}

package() {
    cd "${srcdir}/${_gitname}"
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/opt"
    mkdir -p "${pkgdir}/usr/share/applications"

    cat > "${pkgdir}/usr/share/applications/${_gitname}.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=FreeSSM
Icon=/opt/FreeSSM/FreeSSM.png
Exec=freessm
Terminal=false
EOF
    make release-install
    ln -s "/opt/${_gitname}/${_gitname}" "${pkgdir}/usr/bin/${_name}"
}
