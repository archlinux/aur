# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=mongodb-compass
pkgver=1.38.2
pkgrel=1
pkgdesc="The MongoDB GUI"
arch=('x86_64')
url="https://www.mongodb.com/products/compass"
license=('custom')
depends=('alsa-lib' 'gtk3' 'libsecret' 'libxss' 'libxtst' 'nss')
optdepends=('org.freedesktop.secrets')
source=("https://downloads.mongodb.com/compass/${pkgname}_${pkgver}_amd64.deb")
noextract=("${pkgname}_${pkgver}_amd64.deb")
b2sums=('eb2b078cd2e39b928d11ce3aac54aafb851077463ae3023c08fd8aa4a4ca37f19eabc1e6f88a79cfb7c54f0d90265de81865ff2e484653355ff3de52e3925bf5')

package() {
    bsdtar -O -xf "${pkgname}_${pkgver}"*.deb data.tar.xz | bsdtar -C "$pkgdir" -xJf -

    # Permission fix
    find "${pkgdir}" -type d -exec chmod 755 {} +
    find "${pkgdir}" -type f -exec chmod 644 {} +
    chmod +x "${pkgdir}"/usr/lib/mongodb-compass/"MongoDB Compass"

    # Remove all unnecessary stuff
    rm -rf "${pkgdir}/usr/share/lintian"
    rm -rf "${pkgdir}/usr/share/doc"

    # Install license
    install -dm755 ${pkgdir}/usr/share/licenses/${pkgname}
    ln -s /usr/share/${pkgname}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}
}
