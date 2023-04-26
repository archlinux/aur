# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-comtool
pkgver=3.1.4
pkgrel=0
epoch=
pkgdesc="A cross platform serial debug tools written by python"
arch=('any')
url="https://github.com/Neutree/COMTool"
license=('LGPL3.0')
groups=()
depends=('python' 'python-pyqt5' 'python-pyserial' 'python-requests' 'python-babel' 'python-qtawesome' 'python-paramiko' 'python-pyte' 'python-pyperclip' 'python-coloredlogs' 'python-pyqtgraph')
makedepends=('python-build' 'python-installer' 'python-wheel')
checkdepends=()
optdepends=()
provides=('COMTool')
conflicts=('comtool' 'python-comtool-git')
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=("${pkgname#python-}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('6056305761b5490e4ca80ba3f60353b50bfc32c1378fc5cbf9f241ee145da87e')
#validpgpkeys=()

build() {
    cd "${srcdir}/COMTool-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/COMTool-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    rm -rf "${pkgdir}/usr/LICENSE"
    rm -rf "${pkgdir}/usr/README.MD"
    install -Dm0644 "${srcdir}/COMTool-${pkgver}/COMTool/assets/logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname#python-}.png"
    install -Dm0644 /dev/stdin "${pkgdir}/usr/share/applications/io.github.neutree.${pkgname#python-}.desktop" << EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=ComTool
Comment=comtool serial communication debug tool
Exec=${pkgname#python-} %U
Icon=${pkgname#python-}.png
Categories=Development;
Terminal=false
StartupNotify=true
MimeType=application/x-executable;
EOF
}
