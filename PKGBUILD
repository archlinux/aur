pkgname=jellyplayer-git
pkgver=6e4e4da
pkgrel=1
pkgdesc="Terminal-based Jellyfin player with MPV integration"
arch=('any')
url="https://github.com/AlexJonker/jellyplayer"
license=('MIT')
depends=('mpv' 'python' 'python-requests')
makedepends=('git' 'pyinstaller')
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/jellyplayer"
  git rev-parse --short HEAD
}

package() {
  cd "$srcdir/jellyplayer"

  # Build the script with pyinstaller, strip debug symbols
  pyinstaller --onefile --strip --clean main.py -n jellyplayer
  
  # Install the resulting binary
  install -Dm755 "dist/jellyplayer" "$pkgdir/usr/bin/jellyplayer"

  # Install MPV config
  install -d "$pkgdir/usr/share/jellyplayer/mpv_config"
  cp -r mpv_config/* "$pkgdir/usr/share/jellyplayer/mpv_config/"
}
