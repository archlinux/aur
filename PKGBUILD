# Maintainer: Teraflops <tu-email@dominio.com>
pkgname=mpvcovergrabber-git
pkgver=r5.90ae274
pkgrel=1
pkgdesc="MPV script that shows cover and metadata for audio and video using LLMs and APIs like Last.fm o TMDB"
arch=('any')
url="https://gitlab.com/teraflops/mpvcovergrabber"
license=('MIT')
depends=('mpv' 'curl' 'coreutils')
optdepends=(
  'ollama: local inference with modelos like gemma2'
  'ollama-cuda: accel backend for Ollama'
)
makedepends=('git')
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/mpvcovergrabber"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/mpvcovergrabber"

  # Instalar script principal
  install -Dm644 etc/mpv/scripts/notify.lua "$pkgdir/etc/mpv/scripts/notify.lua"

  # Instalar patrones
  install -Dm644 etc/mpv/filters/patterns_artist.txt "$pkgdir/etc/mpv/filters/patterns_artist.txt"
  install -Dm644 etc/mpv/filters/patterns_common.txt "$pkgdir/etc/mpv/filters/patterns_common.txt"

  # (Opcional) Documentación o licencia
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

