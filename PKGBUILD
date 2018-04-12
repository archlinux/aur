# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=sysdig-inspect
pkgver=0.3.0
pkgrel=1
pkgdesc="A powerful opensource interface for container troubleshooting and security investigation"
arch=('x86_64')
url="https://github.com/draios/sysdig-inspect"
license=('custom')
depends=('alsa-lib' 'gconf' 'gtk2' 'libsecret' 'libxss' 'libxtst' 'nss')
optdepends=('gnome-keyring')
source=("https://download.sysdig.com/stable/sysdig-inspect/${pkgname}_${pkgver}_amd64.deb")
sha256sums=('efc6087e61cc717efaf6c6b921da9d511763b078403d39d2de06f6800ffefc36')

package() {
    bsdtar -O -xf "${pkgname}_${pkgver}"*.deb data.tar.gz | bsdtar -C "$pkgdir" -xzf -

    # Permission fix
    find "${pkgdir}" -type d -exec chmod 755 {} +

    # Remove all unnecessary stuff
    rm -rf "${pkgdir}/usr/share/lintian"
    rm -rf "${pkgdir}/usr/share/doc"

    # Install license
    install -dm755 ${pkgdir}/usr/share/licenses/${pkgname}
    ln -s /usr/lib/${pkgname}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}
}
