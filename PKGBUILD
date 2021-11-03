# Maintainer: RichieMay

pkgname=microsoft-edge-stable
pkgver=95.0.1020.40
pkgrel=1
pkgdesc="Microsoft Edge Web Browser"
arch=(x86_64)
options=(!strip)
url='https://www.microsoft.com/edge/'
license=('GPL3')
depends=('ca-certificates' 'gtk3' 'libcups' 'nss' 'alsa-lib' 'libxss' 'libxtst' 'ttf-liberation')
source=("microsoft-edge-stable_${pkgver}-${pkgrel}_amd64.deb::https://packages.microsoft.com/repos/edge/pool/main/m/microsoft-edge-stable/microsoft-edge-stable_${pkgver}-${pkgrel}_amd64.deb")

sha256sums=('c5d4965c2216803874bca1b03a354b887e1a468d3a494462f24eb1c7efc4c66a')

package() {
    cd ${srcdir}

    tar -xJvf data.tar.xz -C "${pkgdir}"

    for icon in product_logo_64.png product_logo_32.png product_logo_48.png product_logo_128.png product_logo_256.png product_logo_16.png product_logo_24.png ; do
        size="$(echo ${icon} | sed 's/[^0-9]//g')"
        install -D "$pkgdir/opt/microsoft/msedge/${icon}" "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/microsoft-edge.png"
    done
}
