# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-comtool
_name=COMTool
pkgver=3.4.1
pkgrel=1
epoch=
pkgdesc="A cross platform serial debug tools written by python"
arch=('any')
# url="https://pypi.org/project/COMTool"
url="https://github.com/Neutree/COMTool"
license=('LGPL-3.0-or-later')
groups=()
depends=('python'
    'python-pyqt5'
    'python-pyserial'
    'python-requests'
    'python-babel'
    'python-qtawesome'
    'python-paramiko'
    'python-pillow'
    'python-pyte'
    'python-pyperclip'
    'python-coloredlogs'
    'python-numpy'
    'python-qtpy'
    'python-wcwidth'
    'python-pyqtgraph')
makedepends=('python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel')
checkdepends=()
optdepends=()
provides=('COMTool' 'comtool' 'python-comtool')
conflicts=('COMTool' 'comtool' 'python-comtool')
replaces=()
backup=()
options=()
install=$pkgname.install
changelog=
source=(
    "${_name}-${pkgver}.tar.gz::${url}/archive/refs/tags/v$pkgver.tar.gz"
    #     "${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
    $pkgname.install)
noextract=()
sha256sums=('fcaeeedcf2d84268d1fb601f070f4cfbfe456a947777f2fc2457f33892daa523'
            '45b92e9788ac186a4fa2bad728fe7956b2afb52c4f4b01481ddd2b26ed47bdc3')
#validpgpkeys=()

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    rm -rf "${pkgdir}/usr/LICENSE"
    rm -rf "${pkgdir}/usr/README.MD"
    install -Dm0644 "${srcdir}/${_name}-${pkgver}/COMTool/assets/logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname#python-}.png"
    install -Dm0644 /dev/stdin "${pkgdir}/usr/share/applications/io.github.neutree.${pkgname#python-}.desktop" <<EOF
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
