# Maintainer: yhaupenthal <y dot h plus aur at posteo dot de>
pkgname=multipass
pkgver='18.06'
pkgrel=1
pkgdesc='Broadcast X11 key events to multiple windows'
arch=('any')
url='https://www.uninformativ.de/git/multipass'
license=('MIT')
depends=('libx11' 'libxft')
makedepends=('git')
source=('git+https://www.uninformativ.de/git/multipass.git')
md5sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname"

  # custom config
  echo "$SRCDEST"
  if [ -e "$SRCDEST"/config.h ] ; then
    echo 'Using custom config.h'
    cp "$SRCDEST"/config.h .
  else
    cp config.def.h config.h
  fi
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm 755 "$srcdir/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
