# This is the PKGBUILD for TMSU

# Maintainer: Tomáš Mládek <tmladek{at}inventati{dt}org> 
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=tmsu
pkgver=0.5.2
pkgrel=3
pkgdesc="A tool for tagging your files and accessing them through a virtual filesystem."
arch=('i686' 'x86_64')
url="http://tmsu.org/"
depends=('go' 'fuse' 'sqlite>=3')
provides=('tmsu')
license=('GNU GPL v3')
source=("https://github.com/oniony/TMSU/archive/v$pkgver.tar.gz")
sha256sums=('c6b749ee20774d39b36ab1182d80e22697bd7a6a9c5af2acbb090db0d867619f')

build(){
  export GOPATH=/tmp

  echo "Now getting go-sqlite3..."
  go get -u github.com/mattn/go-sqlite3

  echo "Now getting go-fuse..."
  go get -u github.com/hanwen/go-fuse/fuse

  cd "$srcdir/TMSU-$pkgver"
  make
}

package(){
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
