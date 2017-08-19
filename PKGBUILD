# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=kickoff-player-git
pkgver=155.fbfbe8d
pkgrel=1
pkgdesc="Stream football matches and channels with acestream and sopcast"
arch=("any")
url="https://github.com/jonian/kickoff-player"
license=("GPL")
depends=("gtk3" "gstreamer" "python" "python-gobject" "python-psutil" "python-pexpect" "python-peewee" "python-requests" "python-fuzzywuzzy" "python-levenshtein" "python-dateutil" "python-lxml" "acestream-engine" "sopcast")
makedepends=("git")
provides=("kickoff-player")
source=("$pkgname::git+https://github.com/jonian/kickoff-player")
md5sums=("SKIP")

pkgver() {
  cd "${srcdir}/${pkgname}"
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  mkdir -p "$pkgdir/opt"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/icons/hicolor"
  mkdir -p "$pkgdir/usr/share/icons/gnome"
  mkdir -p "$pkgdir/usr/share/applications"

  cp -a "$srcdir/$pkgname" "$pkgdir/opt/$pkgname"
  cp -a "$srcdir/$pkgname/icons/hicolor/." "$pkgdir/usr/share/icons/hicolor"
  cp -a "$srcdir/$pkgname/icons/hicolor/." "$pkgdir/usr/share/icons/gnome"

  update-desktop-database "$pkgdir/opt/$pkgname"

  ln -s "/opt/$pkgname/kickoff_player.py" "$pkgdir/usr/bin/kickoff-player"
  mv "$pkgdir/opt/$pkgname/kickoff-player.desktop" "$pkgdir/usr/share/applications/kickoff-player.desktop"
}
