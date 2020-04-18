# Maintainer: Alec Mev <alec@mev.earth>

pkgname=mpv-plugin-excerpt-git
pkgver=r13.cf52a04
pkgrel=1
pkgdesc='Excerpt creation from within mpv'
arch=('any')
url=https://gitlab.com/lvml/mpv-plugin-excerpt
license=('GPL2')
depends=(
  'ffmpeg'
  'mpv'
)
makedepends=('git')
source=(
  'autoplay.patch'
  "${pkgname}::git+https://gitlab.com/lvml/mpv-plugin-excerpt.git"
)
sha256sums=(
  '2430864e52d42878ba9b19e6e8e1671a0c1e8af4c2cb004b7388d76eee8b9c9f'
  'SKIP'
)

prepare() {
  cd "${pkgname}"
  patch --strip=1 < ../autoplay.patch
}

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "`git rev-list --count HEAD`" "`git rev-parse --short HEAD`"
}

package() {
  cd "${pkgname}"
  install -Dm755 -t "${pkgdir}/usr/bin/" excerpt_copy
  install -Dm644 -t "${pkgdir}/usr/lib/mpv/" excerpt.lua
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}/" README.md
}
