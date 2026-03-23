# Maintainer: Ravyar <ravyar.tahir@ravarage.xyz>
# Contributor: Daniel Poellmann <aur@<lastname><firstname>.de>
# Contributor: Dusan Saiko <dusan at saiko dot cz>

_pkgname='kreya'
pkgname="${_pkgname}-bin"
pkgver=1.19.1
pkgrel=1
pkgdesc='GUI client for gRPC and REST APIs'
arch=('x86_64')
url='https://kreya.app/'
license=('custom')
depends=('hicolor-icon-theme' 'gtk3' 'webkit2gtk' 'libx11' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxi' 'libxrandr' 'libxrender' 'libxtst' 'alsa-lib' 'at-spi2-core' 'dbus' 'glib2' 'libcups' 'nss' 'pango')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("https://stable-downloads.kreya.app/${pkgver}/Kreya-app-linux-x64.tar.gz")
sha256sums=('0ccdf48abd9cc41d73054412fc63e40b32bd31468404519aef7f1ee083d0f805')
options=("!strip")

package() {
    # Create necessary system directories in the package root
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/lib"
    mkdir -p "${pkgdir}/usr/share"

    # Copy extracted folders (using . to copy contents into the usr/ folders)
    # This assumes bin, lib, and share are in the root of src/
    cp -r "${srcdir}/bin/." "${pkgdir}/usr/bin/"
    cp -r "${srcdir}/lib/." "${pkgdir}/usr/lib/"
    cp -r "${srcdir}/share/." "${pkgdir}/usr/share/"

    # Install the license file specifically
    install -Dm0644 "${srcdir}/share/licenses/app.kreya.Kreya/kreya.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
