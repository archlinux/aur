# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=sysdig-inspect-bin
pkgver=0.12.1
pkgrel=1
pkgdesc="A powerful opensource interface for container troubleshooting and security investigation"
arch=('x86_64')
url="https://github.com/draios/sysdig-inspect"
license=('GPL-2.0-or-later')
depends=('alsa-lib' 'gtk3' 'libxss' 'libxtst' 'nss')
optdepends=('org.freedesktop.secrets')
options=('!debug')
source=("${pkgname}_${pkgver}_amd64.deb::https://github.com/draios/sysdig-inspect/releases/download/${pkgver}/${pkgname%-bin}-linux-x86_64.deb")
noextract=("${pkgname}_${pkgver}_amd64.deb")
b2sums=('451d5c3f95a9767566c31d3754ebdf412f582765cce1fb2b3a8ea73b05c0d09fd95cd17faa4b29afada460fd107917a9658d3623ad10f3e52668d34460eba2eb')

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
