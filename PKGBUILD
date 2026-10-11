# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=snippy-snippet
pkgver=1.4.0
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
  'dotool: GNOME/KDE support'
  'wofi: GNOME support'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e4784048235670462a587b4c0cea4e97f3068c4a12723ad8f15a7afeb9de0742')

prepare() {
  cd "snippy-$pkgver"
  sed --in-place --regexp-extended --expression "s/(readonly version=).*$/\1$pkgver/" snippy
}

package() {
  cd "snippy-$pkgver"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 snippy "$pkgdir"/usr/bin/$pkgname
}
