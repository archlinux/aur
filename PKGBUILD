# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=sysdig-inspect-bin
pkgver=0.10.2
pkgrel=1
pkgdesc="A powerful opensource interface for container troubleshooting and security investigation"
arch=('x86_64')
url="https://github.com/draios/sysdig-inspect"
license=('GPL-2.0-or-later')
depends=('alsa-lib' 'gtk3' 'libxss' 'libxtst' 'nss')
optdepends=('org.freedesktop.secrets')
source=("${pkgname}_${pkgver}_amd64.deb::https://github.com/draios/sysdig-inspect/releases/download/${pkgver}/${pkgname%-bin}-linux-x86_64.deb")
noextract=("${pkgname}_${pkgver}_amd64.deb")
b2sums=('d9b005041a2b2f394d0b2f44ba573320a4b0cf18f0a12aab7d0f58cd53503b293a764e45eaacf5978c7c38e8833fca106d284445dcadffd3510e21cb5c33643a')

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
