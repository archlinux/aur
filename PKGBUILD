#Maintainer: Dhiki Indryanto <dhiki dot indryanto at gmail dot com>
pkgname=atlasvpn-bin
pkgver=1.0.3
pkgrel=1
pkgdesc="Package to install AtlasVPN"
arch=(x86_64)
url="https://atlasvpn.com"
license=("custom")
options=(!strip)
install=atlasvpn-bin.install
source=("https://repo.atlasvpn.com/debian/pool/main/a/atlasvpn/atlasvpn_${pkgver}_amd64.deb")
sha256sums=('969fd91120b29ec3e618118fbd3d0c5a16006cc2bc1819026d7d4defc8bd7b3c')

build() {
  mkdir -p "${srcdir}/data"
  tar -xf "${srcdir}/data.tar.xz" -C "${srcdir}/data"
}

package() {
    install -Dm755 "${srcdir}/data/usr/bin/atlasvpn" -t "${pkgdir}/usr/bin/"
    install -Dm755 "${srcdir}/data/usr/sbin/atlasvpnd" -t "${pkgdir}/usr/bin/"

    install -Dm644 "${srcdir}/data/usr/lib/systemd/system/atlasvpnd.service" -t "${pkgdir}/usr/lib/systemd/system/"
    install -Dm644 "${srcdir}/data/usr/lib/systemd/system/atlasvpnd.socket" -t "${pkgdir}/usr/lib/systemd/system/"
}
