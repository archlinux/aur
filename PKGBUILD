# Maintainer: Adam Mlady <adam.mlady@elevated.ovh>

pkgname="booruflow-bin"
pkgdesc="An open-source, cross-platform booru browser and image downloader."
pkgrel=1
pkgver=0.13.1

url="https://github.com/normalllll/BooruFlow"
arch=('x86_64')
license=('GPL-3.0-or-later')
provides=('booruflow')
conflicts=('booruflow')
depends=('gtk3' 'gcc-libs')
option=('!strip')

source=(
  "https://github.com/normalllll/BooruFlow/releases/download/v${pkgver}%2B41/linux_amd64.deb"
)
sha256sums=('2ff719b7d08286d333f7b30a11c6922fdc2ff5cb92ac4edafcc61260057dc82d')

prepare() {
  bsdtar -xf "${srcdir}/linux_amd64.deb" -C "${srcdir}" data.tar.zst
  bsdtar -xf "${srcdir}/data.tar.zst" -C "${srcdir}"
}

package() {
  # Install the application bundle and supporting files
  install -dm755 "${pkgdir}/usr"
  cp -a "${srcdir}/usr" "${pkgdir}/"

  # Ensure wrapper is executable (already is, but explicit)
  chmod 755 "${pkgdir}/usr/bin/booruflow"
  chmod 755 "${pkgdir}/usr/lib/booruflow/booruflow"
}
