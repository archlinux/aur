# Maintainer: Adam Mlady <adam.mlady@elevated.ovh>

pkgname="booruflow-bin"
pkgdesc="An open-source, cross-platform booru browser and image downloader."
pkgrel=1
pkgver=0.11.0

url="https://github.com/normalllll/BooruFlow"
arch=('x86_64')
license=('GPL-3.0-or-later')
provides=('booruflow')
conflicts=('booruflow')
depends=('gtk3' 'gcc-libs')
option=('!strip')

source=(
  "https://github.com/normalllll/BooruFlow/releases/download/v${pkgver}%2B38/linux_amd64.deb"
)
sha256sums=(
  "0590147bf18df2942c4ccdd710cea10c7bd08dbc59fec6f96647867250c3e78f"
)

prepare() {
  bsdtar -xf "${srcdir}/linux_amd64.deb" -C "${srcdir}" data.tar.xz
  bsdtar -xf "${srcdir}/data.tar.xz" -C "${srcdir}"
}

package() {
  # Install the application bundle and supporting files
  install -dm755 "${pkgdir}/usr"
  cp -a "${srcdir}/usr" "${pkgdir}/"

  # Ensure wrapper is executable (already is, but explicit)
  chmod 755 "${pkgdir}/usr/bin/booruflow"
  chmod 755 "${pkgdir}/usr/lib/booruflow/booruflow"
}
