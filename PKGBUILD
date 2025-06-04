pkgname=playfin
pkgver=r90.ad2cf26
pkgrel=1
pkgdesc="Terminal-based Jellyfin player with MPV integration"
arch=('any')
url="https://github.com/AlexJonker/playfin"
license=('MIT')
depends=('mpv' 'python' 'python-requests')
makedepends=('git' 'pyinstaller')
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/playfin"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "$srcdir/playfin"

  pyinstaller --onefile --strip --clean main.py -n playfin
  
  install -Dm755 "dist/playfin" "$pkgdir/usr/bin/playfin"

  install -d "$pkgdir/usr/share/playfin/mpv_config"
  cp -r mpv_config/* "$pkgdir/usr/share/playfin/mpv_config/"
}
