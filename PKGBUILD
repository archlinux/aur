# Maintainer: shinka <shinnkka1@gmail.com>
pkgname=sddm-theme-noctalia-git
pkgver=r24.05d3761
pkgrel=2
pkgdesc="a theme designed to complement the Noctalia Shell experience."
arch=('any')
url="https://github.com/mda-dev/noctalia-sddm-theme"
license=('MIT')
depends=('sddm' 'qt5-declarative' 'qt5-quickcontrols2' 'qt5-graphicaleffects' 'qt5-svg' )
makedepends=('git')
optdepends=('jq: for the sync-shell-wallpaper.sh script')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
sha256sums=('SKIP')
install="sddm-theme-noctalia.install"

pkgver() {
  cd "$srcdir/noctalia-sddm-theme"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -dm755 "$pkgdir/usr/share/sddm/themes/noctalia"
  
  cd "$srcdir/noctalia-sddm-theme"
  cp -r * "$pkgdir/usr/share/sddm/themes/noctalia/"
  
  # Remove the installer directory as it is not needed for the package
  rm -rf "$pkgdir/usr/share/sddm/themes/noctalia/installer"

  # Ensure executable permission for the sync script
  chmod +x "$pkgdir/usr/share/sddm/themes/noctalia/sync-shell-wallpaper.sh"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
