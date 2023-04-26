# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-comtool-git
pkgver=3.2.1.r0.gd7bb5aa
pkgrel=1
epoch=
pkgdesc="A cross platform serial debug tools written by python"
arch=('any')
url="https://github.com/Neutree/COMTool"
license=('LGPL3.0')
groups=()
depends=('python' 'python-pyqt5' 'python-pyserial' 'python-requests' 'python-babel' 'python-qtawesome' 'python-paramiko' 'python-pyte' 'python-pyperclip' 'python-coloredlogs' 'python-pyqtgraph')
makedepends=('python-build' 'python-installer' 'python-wheel' 'git')
checkdepends=()
optdepends=()
provides=('COMTool')
conflicts=('comtool' 'python-comtool')
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=("git+${url}.git")
noextract=()
sha256sums=('SKIP')
#validpgpkeys=()

pkgver() {
    cd "${srcdir}/COMTool"
    git describe --long --tags | sed 's/v//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/COMTool"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/COMTool"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    rm -rf "${pkgdir}/usr/LICENSE"
    rm -rf "${pkgdir}/usr/README.MD"
    install -Dm0644 "${srcdir}/COMTool/COMTool/assets/logo.png" "${pkgdir}/usr/share/pixmaps/comtool.png"
    install -Dm0644 /dev/stdin "${pkgdir}/usr/share/applications/io.github.neutree.comtool.desktop" << EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=ComTool
Comment=comtool serial communication debug tool
Exec=comtool %U
Icon=comtool.png
Categories=Development;
Terminal=false
StartupNotify=true
MimeType=application/x-executable;
EOF
}
