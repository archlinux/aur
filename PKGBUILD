pkgname=wkey
pkgver=0.1.1
pkgrel=1
pkgdesc='Which key should I press? A CLI cheatsheet.'
arch=('x86_64')
url='https://github.com/greasycat/wkey'
license=('MIT')
depends=(
  'gcc-libs'
  'glibc'
)
optdepends=('fzf: use fzf for the initial search selector')
source=(
  "https://github.com/greasycat/wkey/releases/download/v${pkgver}/wkey-${CARCH}-unknown-linux-gnu.tar.xz"
  "https://github.com/greasycat/wkey/releases/download/v${pkgver}/wkey-${CARCH}-unknown-linux-gnu.tar.xz.sha256"
)
sha256sums=(
  '920a9198e310d0437c17079ac9a5548668d532aed7558563c6fa55d6ca9c927b'
  '5dce36296b9632962e9675cf0820fb73535d72b30fdf2a60438eb8c23fe5f64d'
)

prepare() {
  cd "${srcdir}"
  sha256sum --check --ignore-missing "wkey-${CARCH}-unknown-linux-gnu.tar.xz.sha256"
}

package() {
  local _archive_dir="${srcdir}/wkey-${CARCH}-unknown-linux-gnu"

  install -Dm755 "${_archive_dir}/wkey" "${pkgdir}/usr/bin/wkey"
  install -Dm644 "${_archive_dir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${_archive_dir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
