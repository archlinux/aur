# Maintainer: rezky_nightky <rezky2399@proton.me>
pkgname=zejtron-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Small Linux terminal toolkit for tracing paths, ports, env, recent files, and services"
arch=('x86_64' 'aarch64')
url="https://github.com/oxyzenQ/zejtron"
license=('MIT')
depends=('glibc' 'gcc-libs')
provides=('zejtron')
conflicts=('zejtron')
options=('!strip')
source=()
sha512sums=()

prepare() {
  local tag="v${pkgver}"
  local asset

  case "${CARCH}" in
    x86_64)
      asset="zejtron-bin-${tag}-linux-x86_64.tar.gz"
      ;;
    aarch64)
      asset="zejtron-bin-${tag}-linux-aarch64.tar.gz"
      ;;
    *)
      echo "unsupported architecture: ${CARCH}" >&2
      return 1
      ;;
  esac

  local base_url="https://github.com/oxyzenQ/zejtron/releases/download/${tag}"
  curl -fL -o "${asset}" "${base_url}/${asset}"
  curl -fL -o "${asset}.sha512" "${base_url}/${asset}.sha512"
  sha512sum --check "${asset}.sha512"
  mkdir -p "${srcdir}/archive"
  tar -xzf "${asset}" -C "${srcdir}/archive"
}

package() {
  install -Dm755 "${srcdir}/archive/zejtron" "${pkgdir}/usr/bin/zejtron"
  install -Dm644 "${srcdir}/archive/LICENSE" "${pkgdir}/usr/share/licenses/zejtron-bin/LICENSE"
  install -Dm644 "${srcdir}/archive/README.md" "${pkgdir}/usr/share/doc/zejtron-bin/README.md"
}
