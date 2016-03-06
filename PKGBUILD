# Maintainer: fsckd <fsckdaemon at gmail dot com>

pkgname=jo-git
pkgver=r26.4f74287
pkgrel=1
pkgdesc='A shell command to create JSON'
arch=('i686' 'x86_64')
url='http://jpmens.net/2016/03/05/a-shell-command-to-create-json-jo/'
license=('GPL' 'MIT')
makedepends=('git')
source=('git://github.com/jpmens/jo')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/jo"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/jo"
  # won't build in Arch otherwise
  sed -i 's/^\(CFLAGS\)=/\1+=/' Makefile
}

build() {
  cd "$srcdir/jo"
  make jo
  # man page may already be made
  # if it isn't, add pandoc to makedeps and:
  # make jo.1
}

package() {
  cd "$srcdir/jo"
  install -Dm755 jo "$pkgdir/usr/bin/jo"
  install -Dm644 jo.1 "$pkgdir/usr/usr/share/man/man1/jo.1"
}
