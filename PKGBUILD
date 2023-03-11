# Maintainer: Simon <aur at simon42 dot net>

pkgname=fastx-desktop-client
pkgver=3.2.32
pkgrel=1
pkgdesc="Client to connect to StarNet FastX servers"
arch=('x86_64')
url="https://www.starnet.com/fastx/"
license=('custom')
depends=('brotli' 'bzip2' 'expat' 'freetype2' 'harfbuzz' 'keyutils' 'libglvnd' 'libgpg-error'
         'libpng' 'libx11' 'libxau' 'libxcb' 'libxdmcp' 'pcre' 'pcre2' 'qt5-svg' 'qt5-webengine'
         'qt5-websockets' 'qt5-x11extras')
provides=('FastX3' 'fastxcli')
options=('!strip')

source=("fastx.desktop"
        "https://www.starnet.com/files/private/FastX3/FastX3-$pkgver.rhel7.$CARCH.tar.gz")
sha256sums=('530ccaeaeb97d0a2946f9d18219d2ed6b62d8ae40584c4f465b149760cd615d0'
            'cf115660e7ba653eba73b4a80e8c34fcff5e59d51ffa1a0c4eed42f2b1084afb')

package() {
    # Copy FastX client and libraries to proper location
    mkdir -p "${pkgdir}/opt"
    cp -dpr --no-preserve=ownership "${srcdir}/FastX3" "${pkgdir}/opt"

    # Symlink FastX client and CLI located in /opt
    mkdir -p "${pkgdir}/usr/bin"
    ln -sf /opt/FastX3/FastX3 "${pkgdir}/usr/bin/FastX3"
    ln -sf /opt/FastX3/fastxcli "${pkgdir}/usr/bin/fastxcli"

    # Install starter
    install -Dm644 "${srcdir}/fastx.desktop" "${pkgdir}/usr/share/applications/fastx.desktop"
}
