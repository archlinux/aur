# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=snippy-snippet
pkgver=1.1.2
pkgrel=1
pkgdesc='Snippet manager with rofi (X11 / Wayland) and fzf (CLI)'
arch=('any')
url='https://github.com/barbUk/snippy'
license=('GPL-3.0-or-later')
conflicts=("${pkgname}-git")
depends=(bash fzf jq rofi)
optdepends=(
  'wtype: Wayland support'
  'wl-clipboard: Wayland support'
  'xsel: X11 support'
  'xclip: X11 support'
  'xdotool: X11 support'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1559c854691e48d382b3f081587f4474215743f8b90c4c55ca30693c06d69d8c')

prepare() {
  cd "snippy-$pkgver"
  sed --in-place --regexp-extended --expression "s/(readonly version=).*$/\1$pkgver/" snippy
}

package() {
  cd "snippy-$pkgver"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 snippy "$pkgdir"/usr/bin/$pkgname
}
