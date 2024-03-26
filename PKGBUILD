# Maintainer: Albert Zhang <bert@alchzh.me>

pkgname=sddm-theme-catppuccin
pkgver=1.0.0
pkgrel=1
pkgdesc='Soothing pastel theme for SDDM'

arch=('any')
url='https://github.com/catppuccin/sddm'
license=('MIT')

depends=(
  'sddm'
  'qt6-svg'
  'qt6-declarative'
)
conflicts=("$pkgname-git")

_themes=(
  'catppuccin-latte'
  'catppuccin-frappe'
  'catppuccin-macchiato'
  'catppuccin-mocha'
)

source=(
  'https://raw.githubusercontent.com/catppuccin/sddm/main/LICENSE'
  $(printf "https://github.com/catppuccin/sddm/releases/download/v$pkgver/%s.zip " "${_themes[@]}")
)
sha256sums=('814096d2c34cc216c624738a49356f32b7237733b4f7edb0685f4e50ef5074ba'
            '19cc14098c9cc709334b6f65598520834f373bd24702301411c6ac1a6ecc4c32'
            '6b7eb5e549e9a2bb28f7c6f8f42997bd55aaac172158aa2dcd780c2bfa262774'
            '4a43034dfe13195632fea8243d3f732c2a5806b7857ae131ba2ba0da7a7204fa'
            '1fb17a79685d97ea616e81c0b9f4fd01c70bdd08f4f5c11d33db7eb0b1d32999')

backup=($(printf 'usr/share/sddm/themes/%s/theme.conf ' "${_themes[@]}"))

package() {
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  for theme in "${_themes[@]}"; do
    find ./$theme -type f -exec install -Dm644 {} "$pkgdir/usr/share/sddm/themes/{}" \;
  done
}

