# Maintainer: hendy643 <phenderson643@gmail.com>

pkgver=1.0.0
_pkgver_ext=beta.16
pkgrel=1
pkgname=ezy-bin
pkgdesc="Fully-featured desktop gRPC/gRPC-Web client."

arch=('x86_64' 'aarch64')
url="https://github.com/getezy/ezy"
license=('MPL-2.0')

depends=(
    'at-spi2-core' 'cairo' 'libdrm' 'libcups' 'gtk3'
    'alsa-lib' 'libxcb' 'libxkbcommon' 'nss' 'glibc' 'libx11'
    'pango' 'gcc-libs' 'nspr' 'expat' 'hicolor-icon-theme' 'mesa'
    'libxcomposite' 'glib2' 'libxdamage' 'libxrandr' 'libxfixes'
)
provides=('ezy')
conflicts=('ezy' 'ezy-bin' 'ezy-git')
replaces=('ezy' 'ezy-bin' 'ezy-git')

# https://github.com/getezy/ezy/releases/download/v1.0.0-beta.16/ezy_1.0.0.beta.16_amd64.deb
source_x86_64=("https://github.com/getezy/ezy/releases/download/v${pkgver}-${_pkgver_ext}/ezy_${pkgver}.${_pkgver_ext}_amd64.deb")
sha256sums_x86_64=('94155cb00252b4f680a8fff57f1b76dbc5ce648f0ee9cba769ef1c49d34f357b')
source_aarch64=("https://github.com/getezy/ezy/releases/download/v${pkgver}-${_pkgver_ext}/ezy_${pkgver}.${_pkgver_ext}_arm64.deb")
sha256sums_aarch64=('ce5d5975465ae4d6fbf4adff880b610ad96c527eac3cf4435e66ec525d2bdef2')

build() {
    cd "$srcdir"
    bsdtar -xvf "ezy_${pkgver}.${_pkgver_ext}_$( [[ $CARCH == 'x86_64' ]] && echo 'amd64' || echo 'arm64' ).deb"
    tar xvf data.tar.xz
    return 0
}

package() {
    # as the extracted files already have the correct structure, we can just copy them to the package directory
    cp -r "$srcdir/usr/" "$pkgdir/usr/"
    return 0
}