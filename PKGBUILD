# $Id$
# Maintainer: CountMurphy <spartan1086@gmail.com>
pkgname=mediatracker-git
__pkgname="MediaTracker"
pkgver=r477.4cc562e
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/bonukai/MediaTracker.git"
pkgdesc="Self hosted platform for tracking movies, tv shows, video games, books and audiobooks."
license=('MIT')
depends=('nodejs' 'sqlite')
makedepends=( 'npm' 'git')
source=("git+https://github.com/bonukai/MediaTracker.git")
md5sums=('SKIP')

pkgver() {
  cd "$__pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/MediaTracker"
  npm install
  npm run build
}

package() {

  mkdir -p $pkgdir/srv/MediaTracker
  cp -Ra $srcdir/MediaTracker/ "$pkgdir/srv/"
  rm -R $pkgdir/srv/MediaTracker/.git
  install=mediatracker.install
  pwd 
  install -Dm 644 ../mediatracker.service -t "$pkgdir"/usr/lib/systemd/system/
}


