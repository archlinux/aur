# Maintainer: Pasical <pasicalyang@gmail.com>
pkgname=everywhere-bin
pkgver=0.0.4
pkgrel=1
pkgdesc="Context-aware AI assistant for your desktop. Ready to respond intelligently, seamlessly integrating multiple LLMs and MCP tools."
arch=('x86_64')
url="https://github.com/pasical/Everywhere"
license=('BSL-1.1')
depends=('dotnet-runtime' 'fontconfig' 'libx11' 'libice' 'libsm' 'hicolor-icon-theme')
provides=('everywhere')
conflicts=('everywhere')

_filename="Everywhere-Linux-x64-v${pkgver}.deb"

source=("${url}/releases/download/v${pkgver}/${_filename}"
        "https://raw.githubusercontent.com/pasical/Everywhere/main/LICENSE")

sha256sums=('7989bac4a04a7fc49b7650ea81052d70b9b947a979ae8bb2185e40f5245e18d2'
            '50547a76ee06c9886541b2a20abc83700fc3ae4b2de74094f86d2dd8f0229ba8')

package() {
    cd "${srcdir}"
    _deb_file="${startdir}/${_filename}"
    bsdtar -xf "$_deb_file"
    bsdtar -xf data.tar.* -C "${pkgdir}"
    find "${pkgdir}" -type d -exec chmod 755 {} +
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/Everywhere/Everywhere" "${pkgdir}/usr/bin/Everywhere"
    
    if [ -f "${pkgdir}/opt/Everywhere/Everywhere.desktop" ]; then
        mkdir -p "${pkgdir}/usr/share/applications"
        cp "${pkgdir}/opt/Everywhere/Everywhere.desktop" "${pkgdir}/usr/share/applications/"
    fi  
    
    mkdir -p "${pkgdir}/usr/share/licenses/everywhere"
    if [ -f "${srcdir}/LICENSE" ]; then
        cp "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/everywhere/"
    fi
}
