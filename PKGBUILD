# Maintainer: Troy Engel <troyengel+arch@gmail.com>
# Contributor: OK100 <ok100 at openmailbox dot org>

pkgname=cmusfm-git
pkgver=33.1441155
pkgrel=1
pkgdesc="Last.fm scrobbler for cmus music player"
url="https://github.com/Arkq/cmusfm"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('cmus' 'curl' 'libnotify')
makedepends=('git')
conflicts=('cmusfm')
provides=('cmusfm')
install='cmusfm.install'
source=("$pkgname"::'git://github.com/Arkq/cmusfm.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$srcdir/$pkgname"
  autoreconf --install
  ./configure --prefix="$pkgdir/usr" --enable-libnotify
  make
}

package() {
  cd "$srcdir/$pkgname"
  make install
}
