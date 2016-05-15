# Maintainer: bruceutut <zy183525594@163.com>

pkgname=feeluown-dev-git
_pkgname=FeelUOwn
_rev=9c09a81
pkgver=20160514.${_rev}
pkgrel=1
pkgdesc="个性化音乐服务 For Mac And Linux 开发版"
arch=("any")
url="https://github.com/cosven/FeelUOwn"
license=('GPL3')
depends=('python-pyqt5' 'python-requests' 'python-quamash' 'python-sqlalchemy' 'python-dbus' 'qt5-multimedia' 'xdg-utils' 'python-yaml' 'fcitx-qt5')
optdepends=()
makedepends=('git')
provides=("feeluown" "feeluown-git")
conflicts=("feeluown" "feeluown-git")
source=('git://github.com/cosven/FeelUOwn.git#branch=dev'
        'https://raw.githubusercontent.com/cosven/FeelUOwn/master/feeluown/feeluown.png')
md5sums=('SKIP' 'SKIP')
_desktop="${_pkgname}.desktop"


build() {
    cd "$srcdir"
    cat > ${_desktop} << EOF
[Desktop Entry]
Type=Application
Name=FeelUOwn Dev
Comment=FeelUOwn Launcher
Exec=${_pkgname}
Icon=/opt/${pkgname}/feeluown/feeluown.png
Categories=AudioVideo;Audio;Player;Qt;
Terminal=false
StartupNotify=true
EOF
    cat > "${_pkgname}.sh" << EOF
#!/usr/bin/env sh
cd /opt/${pkgname}
python -m feeluown -d \$*
EOF
}

package() {
    cd "$srcdir"
    cd "$srcdir"/"$_pkgname"
    find ./{feeluown,icons} -type f -exec install -Dm644 {} \
        "${pkgdir}/opt/${pkgname}/{}" \;
    install -Dm644 "${srcdir}"/feeluown.png "${pkgdir}"/opt/${pkgname}/feeluown/feeluown.png
    install -Dm644 "${srcdir}/${_desktop}" "${pkgdir}/usr/share/applications/${_desktop}"
    install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
}

