pkgname=playfin
pkgver=738a894
pkgrel=1
pkgdesc="Terminal-based Jellyfin player with MPV integration"
arch=('any')
url="https://github.com/AlexJonker/playfin"
license=('MIT')
depends=('mpv' 'python' 'python-requests')
makedepends=('git' 'pyinstaller')
conflicts=('jellyplayer-git')
replaces=('jellyplayer-git')
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/playfin"
  git rev-parse --short HEAD
}

package() {
  cd "$srcdir/playfin"

  # Build the script with pyinstaller, strip debug symbols
  pyinstaller --onefile --strip --clean main.py -n playfin
  
  # Install the resulting binary
  install -Dm755 "dist/playfin" "$pkgdir/usr/bin/playfin"

  # Install MPV config
  install -d "$pkgdir/usr/share/playfin/mpv_config"
  cp -r mpv_config/* "$pkgdir/usr/share/playfin/mpv_config/"
}
