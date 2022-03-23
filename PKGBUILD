# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-comtool
pkgver=2.4.0
pkgrel=1
epoch=
pkgdesc="A cross platform serial debug tools written by python"
arch=('any')
url="https://github.com/Neutree/COMTool"
license=('LGPL3.0')
groups=()
depends=('python' 'python-pyqt5' 'python-pyserial' 'python-requests' 'python-babel' )
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
sha256sums=('17a1724f35e67419ce3113b3e5e1fd119b2b55b935badb6b2be7aec7cbf0db4f')
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
