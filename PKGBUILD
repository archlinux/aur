# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=mongodb-compass
pkgver=1.11.2
pkgrel=1
pkgdesc="The MongoDB GUI"
arch=('x86_64')
url="https://www.mongodb.com/products/compass"
license=('custom')
depends=('alsa-lib' 'gconf' 'gtk2' 'libsecret' 'libxss' 'libxtst' 'nss')
optdepends=('gnome-keyring')
source=("https://downloads.mongodb.com/compass/${pkgname}_${pkgver}_amd64.deb")
sha256sums=('149f4eab7641dbac2094c1e4b6c66e9039b2ba81ac6ab875913aa91a93e461b2')

package() {
    bsdtar -O -xf "${pkgname}_${pkgver}"*.deb data.tar.xz | bsdtar -C "$pkgdir" -xJf -

    # Permission fix
    find "${pkgdir}" -type d -exec chmod 755 {} +

    # Remove all unnecessary stuff
    rm -rf "${pkgdir}/usr/share/lintian"
    rm -rf "${pkgdir}/usr/share/doc"

    # Install license
    install -dm755 ${pkgdir}/usr/share/licenses/${pkgname}
    ln -s /usr/share/${pkgname}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}
}
