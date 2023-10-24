# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=sysdig-inspect
pkgver=0.9.0
pkgrel=1
pkgdesc="A powerful opensource interface for container troubleshooting and security investigation"
arch=('x86_64')
url="https://github.com/draios/sysdig-inspect"
license=('custom')
depends=('alsa-lib' 'gtk3' 'libxss' 'libxtst' 'nss')
optdepends=('org.freedesktop.secrets')
source=("${pkgname}_${pkgver}_amd64.deb::https://github.com/draios/sysdig-inspect/releases/download/${pkgver}/${pkgname}-linux-x86_64.deb")
noextract=("${pkgname}_${pkgver}_amd64.deb")
b2sums=('9d84794f7ea5a864e41ec8105e7684ea9b7bcf52cd221e5bc3107a8200a9661b202394e43dff20ea064b3da83f73e9a89e03d3cedd00292a5e2c48f16a20e492')

package() {
    bsdtar -O -xf "${pkgname}_${pkgver}"*.deb data.tar.xz | bsdtar -C "$pkgdir" -xJf -

    # Permission fix
    find "${pkgdir}" -type d -exec chmod 755 {} +

    # Remove all unnecessary stuff
    rm -rf "${pkgdir}/usr/share/lintian"
    rm -rf "${pkgdir}/usr/share/doc"

    # Install license
    install -dm755 ${pkgdir}/usr/share/licenses/${pkgname}
    ln -s /usr/lib/${pkgname}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}
}
