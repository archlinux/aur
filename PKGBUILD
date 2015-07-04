# Maintainer: Andrey Vihrov <andrey.vihrov at gmail.com>

pkgname=quake3-edawn
pkgver=1.4.1
pkgrel=1
pkgdesc="A Quake III Arena mod with numerous improvements"
arch=('any')
url="http://edawn-mod.org/"
license=('custom')
depends=('quake3')
source=("http://edawn-mod.org/binaries/edawn-$pkgver.zip")
sha256sums=('5fe22b2b777608719f5e05c34d50e98dffb616ace38397296c0b953040625d16')

package() {
  # Engines other than quake3e may have problems loading files
  # without the .cfg extension
  cd edawn
  for f in {bans,crontab,motd,rotation,voteconf}.txt maps/*.{add,set} ; do
    mv "$f" "$f.cfg"
  done

  cd "$srcdir"
  mkdir -p "$pkgdir/opt/quake3"
  cp -dR edawn "$pkgdir/opt/quake3"

  install -D -m 644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
