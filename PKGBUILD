# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=sysdig-inspect-bin
pkgver=0.11.0
pkgrel=1
pkgdesc="A powerful opensource interface for container troubleshooting and security investigation"
arch=('x86_64')
url="https://github.com/draios/sysdig-inspect"
license=('GPL-2.0-or-later')
depends=('alsa-lib' 'gtk3' 'libxss' 'libxtst' 'nss')
optdepends=('org.freedesktop.secrets')
source=("${pkgname}_${pkgver}_amd64.deb::https://github.com/draios/sysdig-inspect/releases/download/${pkgver}/${pkgname%-bin}-linux-x86_64.deb")
noextract=("${pkgname}_${pkgver}_amd64.deb")
b2sums=('5dbd51b645253ef549481460f5423c96849a492572e8eb44e3c931769c220bf66120adad207cd33d05f73619b06d5344e390a3c3d38bcd4e939653623acbad98')

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
