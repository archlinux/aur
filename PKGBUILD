# Contributor: Joshua Stiefer <facedelajunk@gmail.com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=herrie-git
pkgver=20130329
pkgrel=1
pkgdesc="A minimal music player."
arch=('i686' 'x86_64')
url="http://www.herrie.info" 
license=('GPL')
depends=('libmodplug' 'libsndfile' 'libid3tag' 'libxspf' 'libmad' 'curl' 'dbus-glib')
makedepends=('git')
source=("$pkgname::git://git.80386.nl/herrie"
        'extra-dbus-support.diff')
provides=(herrie)
conflicts=('herrie')
md5sums=('SKIP'
         'f8eebc84ffeeeeaaa3942411354cbb02')
sha1sums=('SKIP'
          'fe00cab8fae31fcc7fdefc30d4f9d6680f8940df')
sha256sums=('SKIP'
            '858140e5ce4a32ed2338a0a76da361648ad32ecf4bc3baecdcb2d2bfb8ea200b')

pkgver() {
  cd "$srcdir/$pkgname"
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

prepare() {
  cd "$srcdir/$pkgname"
  patch -p1 < "$srcdir/extra-dbus-support.diff"
}

build() {
  cd "$srcdir/$pkgname/herrie"
  ./configure
  make
}

package() {
  cd "$srcdir/pkgname/herrie"
  make DESTDIR="$pkgdir" install 
}

