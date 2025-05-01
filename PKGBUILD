pkgname=jellyplayer-git
pkgver=c188df6
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

  # Build the script with pyinstaller
  pyinstaller --onefile jellyplayer.py

  # Install the resulting binary
  install -Dm755 "dist/jellyplayer" "$pkgdir/usr/bin/jellyplayer"
}

