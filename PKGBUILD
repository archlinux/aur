# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=snippy-snippet
pkgver=1.0.11
pkgrel=2
pkgdesc='Snippet manager with rofi/wofi and fzf'
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
sha256sums=('b28bae34a46dd453fa7e5479c00d698b141567d785349fa855968559bb3fa0b8')

prepare() {
  cd "snippy-$pkgver"
  sed --in-place --regexp-extended --expression "s/(readonly version=).*$/\1$pkgver/" snippy
}

package() {
  cd "snippy-$pkgver"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 snippy "$pkgdir"/usr/bin/$pkgname
}
