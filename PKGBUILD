# Maintainer: rezky_nightky <with dot rezky at gmail dot com>
pkgname=zejtron-bin
pkgver=10.0.0
pkgrel=1
pkgdesc="Unified Linux introspection toolkit for paths, ports, processes, files, services, and diagnostics"
arch=('x86_64')
url="https://github.com/oxyzenQ/zejtron"
license=('GPL-3.0-only')
depends=('glibc' 'gcc-libs')
provides=('zejtron')
conflicts=('zejtron')
options=('!strip')
source=()
sha512sums=()

prepare() {
  local tag="v${pkgver}"
  local asset="zejtron-linux-amd64-gnu.tar.gz"

  local base_url="https://github.com/oxyzenQ/zejtron/releases/download/${tag}"
  curl -fL -o "${asset}" "${base_url}/${asset}"
  curl -fL -o "${asset}.sha512sum" "${base_url}/${asset}.sha512sum"
  sha512sum --check "${asset}.sha512sum"
  mkdir -p "${srcdir}/archive"
  tar -xzf "${asset}" -C "${srcdir}/archive"
}

package() {
  install -Dm755 "${srcdir}/archive/zejtron" "${pkgdir}/usr/bin/zejtron"
  install -Dm644 "${srcdir}/archive/LICENSE" "${pkgdir}/usr/share/licenses/zejtron-bin/LICENSE"
  install -Dm644 "${srcdir}/archive/README.md" "${pkgdir}/usr/share/doc/zejtron-bin/README.md"
}
