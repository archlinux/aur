# Maintainer:  Marcin Wieczorek <marcin@marcin.co>
# Contributor: Tomáš Mládek <tmladek{at}inventati{dt}org>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=tmsu
pkgver=0.7.4
pkgrel=1
pkgdesc="A tool for tagging your files and accessing them through a virtual filesystem."
arch=('i686' 'x86_64')
url="http://tmsu.org/"
depends=('fuse' 'sqlite>=3')
makedepends=('git' 'go')
provides=('tmsu')
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/oniony/TMSU/archive/v$pkgver.tar.gz")
sha256sums=('04e8a4c47532a4d8f673c3b3a921a47815c752b2ca1b564f6e1ed58a1b88a177')

build() {
  export GOPATH=/tmp

  echo "Now getting go-sqlite3..."
  go get -u github.com/mattn/go-sqlite3

  echo "Now getting go-fuse..."
  go get -u github.com/hanwen/go-fuse/fuse

  cd "$srcdir/TMSU-$pkgver"
  make
}

package() {
  mkdir -p "$pkgdir/usr/bin" \
           "$pkgdir/usr/bin" \
           "$pkgdir/usr/share/man/man1" \
           "$pkgdir/usr/share/zsh/site-functions"

  cd "$srcdir/TMSU-$pkgver"
  make INSTALL_DIR="$pkgdir/usr/bin" \
  MOUNT_INSTALL_DIR="$pkgdir/usr/bin" \
  MAN_INSTALL_DIR="$pkgdir/usr/share/man/man1" \
  ZSH_COMP_INSTALL_DIR="$pkgdir/usr/share/zsh/site-functions" \
  install
}
