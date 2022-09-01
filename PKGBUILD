# Maintainer: Jason Gerecke <killertofu@gmail.com>

pkgname=hid-replay-git
pkgver=0.7.1.r44.g6d83e48
pkgrel=1
pkgdesc="HID event recorder and utilities."
arch=('i686' 'x86_64')
url="https://github.com/bentiss/hid-replay/"
license=('GPL2')
depends=('glibc')
optdepends=(
    'xmlto: build manpages'
    'asciidoc: build manpages'
)
makedepends=('git')
provides=('hid-replay')
conflicts=('hid-replay')
options=('!libtool')
source=("$pkgname"::git+https://github.com/bentiss/hid-replay.git#branch=master)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed -r 's/^v//;s/-/.r/; s/-/./'
}

build() {
  cd "$srcdir/$pkgname"
  
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
}

