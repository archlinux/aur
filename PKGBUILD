# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=sysdig-inspect
pkgver=0.6.0
pkgrel=1
pkgdesc="A powerful opensource interface for container troubleshooting and security investigation"
arch=('x86_64')
url="https://github.com/draios/sysdig-inspect"
license=('custom')
depends=('alsa-lib' 'gtk3' 'libxss' 'libxtst' 'nss')
optdepends=('org.freedesktop.secrets')
source=("https://download.sysdig.com/stable/sysdig-inspect/${pkgname}_${pkgver}_amd64.deb")
noextract=("${pkgname}_${pkgver}_amd64.deb")
sha256sums=('9ed16172575054fc9c1f353c592dfc32675da8a188ee37dbc7afcf25e920d0a0')

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
