# Maintainer: Cleboost <clement.balarot@gmail.com>
# Contributor: missing-aur project <https://github.com/Cleboost/missing-aur>

pkgname=layerbase-bin
pkgver=0.37.0
pkgrel=1
pkgdesc="A beautiful GUI for managing all your local databases. Create, query, backup, and monitor PostgreSQL, MySQL, MongoDB, Redis, and more. No terminal required. (precompiled binary)"
url="https://layerbase.com"
arch=("x86_64")
depends=("libx11" "libxcomposite" "libxdamage" "libxext" "libxfixes" "libxrandr" "mesa" "nss" "alsa-lib" "at-spi2-core" "cups" "dbus" "expat" "libdrm" "libxkbcommon" "libxss")
makedepends=("libarchive")
provides=("layerbase")
conflicts=("layerbase")
options=("!strip")
license=("LicenseRef-PolyForm-Noncommercial-1.0.0")

source_x86_64=("layerbase-${pkgver}-amd64.deb::https://layerbase.com/api/download/linux?format=deb")
sha256sums_x86_64=('6033c70fd4c76ef664fddf63873db73343662a4ac60e85ae5218ccc9a4916a03')

package() {
  bsdtar -xOf "${srcdir}/layerbase-${pkgver}-amd64.deb" data.tar.xz | bsdtar -xf - -C "${pkgdir}"
  chmod 4755 "${pkgdir}/opt/Layerbase/chrome-sandbox"
  install -dm755 "${pkgdir}/usr/bin"
  ln -sf "/opt/Layerbase/layerbase-desktop" "${pkgdir}/usr/bin/layerbase"
}

