# Maintainer : ShadowKyogre <shadowkyogre dot public at gmail dot com>
# Contributor: Rob McCathie <archaur at rmcc dot com dot au>

pkgname=wallpaperd
pkgver=0.2.1
pkgrel=2
pkgdesc="A small application that takes care of setting the background image, created due to a friend requesting to have different wallpapers on the different workspaces in pekwm"
arch=('i686' 'x86_64')
url="https://projects.pekdon.net/projects/wallpaperd"
license=('MIT')
depends=('bash' 'xorg-server' 'imlib2')
source=("https://projects.pekdon.net/projects/$pkgname/files/$pkgname-$pkgver.tar.gz")
sha1sums=('f502598dd54723918a4a89c0c947cf2a5eb35f58')
install="$pkgname".install

# Moronic server
DLAGENTS=("https::/usr/bin/curl -k -o %o %u")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/$pkgname-$pkgver"/wallpaperd.cfg "$pkgdir"/etc/wallpaperd.cfg
}
