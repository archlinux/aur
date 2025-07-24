# Maintainer: fabienwang <fwhcat@protonmail.com>
pkgname=duckietv-bin
_pkgname=DuckieTV
pkgver=20250611
_pkgver=202506111858
pkgrel=1
pkgdesc="DuckieTV is a Bittorrent searching and tv tracker"
arch=('x86_64')
url="https://github.com/DuckieTV/Nightlies"
license=('FreeBeer')
depends=('xdg-utils')
options=('!strip' '!emptydirs' '!debug')

source_x86_64=(
    "https://github.com/DuckieTV/Nightlies/releases/download/nightly-${_pkgver}/${_pkgname}-${_pkgver}-linux-x64.tar.gz"
)
sha256sums_x86_64=(
    '1a9c8e62755cc2e6a738b93bffbff1f246d7025f6f0d7f71d2cb7f5c0a4154bd'
)

package() {
  install -dm755 "${pkgdir}/opt/DuckieTV/"
  mv DuckieTV "${pkgdir}/opt"

  install -dm755 "${pkgdir}/usr/share/"
  mv share "${pkgdir}/usr/"

  install -dm755 "${pkgdir}/opt/DuckieTV/lib"
  ln -sf "/usr/lib/libudev.so.1" "${pkgdir}/opt/DuckieTV/lib/libudev.so.0"

  chmod 755 "${pkgdir}/opt/DuckieTV/DuckieTV-bin"

  # fix libnw.so not loading and avoid coredump of the app
  chmod -R 755 "${pkgdir}/opt/DuckieTV/"

  install -dm755 "${pkgdir}/usr/bin/"
  ln -s /opt/DuckieTV/DuckieTV "${pkgdir}/usr/bin/DuckieTV"
}
