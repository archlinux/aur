# Maintainer: Adam Mlady <adam.mlady@elevated.ovh>

pkgname="booruflow-bin"
pkgdesc="An open-source, cross-platform booru browser and image downloader."
pkgrel=1
pkgver=0.13.2

url="https://github.com/normalllll/BooruFlow"
arch=('x86_64')
license=('GPL-3.0-or-later')
provides=('booruflow')
conflicts=('booruflow')
depends=('gtk3' 'gcc-libs')
option=('!strip')

source=(
  "https://github.com/normalllll/BooruFlow/releases/download/v${pkgver}%2B42/linux_amd64.deb"
)
sha256sums=('0c971565bec0ce752f9c39b07d4f3b2253b86be63acbbb20538d17e72ebb6198')

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
