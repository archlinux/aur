pkgname=jellyplayer-git
pkgver=5f9e1a5
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
  git describe --tags --always | sed 's/^v//;s/-/./g'
}

package() {
  cd "$srcdir/jellyplayer"

  # Build the script with pyinstaller
  pyinstaller --onefile jellyplayer.py

  # Install the resulting binary
  install -Dm755 "dist/jellyplayer" "$pkgdir/usr/bin/jellyplayer"
}

