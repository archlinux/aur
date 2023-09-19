#Maintainer: Dhiki Indryanto <dhiki dot indryanto at gmail dot com>
pkgname=atlasvpn-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Package to install AtlasVPN"
arch=(x86_64)
url="https://atlasvpn.com"
license=("custom")
options=(!strip)
install=atlasvpn-bin.install
source=("https://repo.atlasvpn.com/debian/pool/main/a/atlasvpn/atlasvpn_${pkgver}_amd64.deb")
sha256sums=('88ace5b82f6a81affc209086a5db4876c107adf4e4d6aea7c9c8e60a4c7480a8')

prepare() {
  echo "Extracting data.tar.xz"
  mkdir -p "${srcdir}/data"
  tar -xf "${srcdir}/data.tar.xz" -C "${srcdir}/data"
}

package() {
    install -Dm755 "${srcdir}/data/usr/bin/atlasvpn" -t "${pkgdir}/usr/bin/"
    install -Dm755 "${srcdir}/data/usr/sbin/atlasvpnd" -t "${pkgdir}/usr/bin/"

    install -Dm644 "${srcdir}/data/lib/systemd/system/atlasvpnd.service" -t "${pkgdir}/usr/lib/systemd/system/"
    install -Dm644 "${srcdir}/data/lib/systemd/system/atlasvpnd.socket" -t "${pkgdir}/usr/lib/systemd/system/"
}
