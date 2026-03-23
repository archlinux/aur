pkgname=wkey
pkgver=0.1.0
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
  '866749e9879cdb66d4d6d961178b3f60627d3e4b08b6f8986aa1b5bc49dc897d'
  '110ede6d25655a98ca493b1b15eb9d811a7fea9ac8ce09b773e98d4acacc821f'
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
