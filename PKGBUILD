# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=jasspa-me
pkgver=20091011
pkgrel=1
pkgdesc="Jasspa.org microemacs editor"
arch=('i686' 'x86_64')
url="http://www.jasspa.com"
license=('GPL')
depends=('ncurses')
source=("http://www.jasspa.com/release_20090909/jasspa-mesrc-${pkgver}.tar.gz"
"http://www.jasspa.com/release_20090909/jasspa-metree-${pkgver}.tar.gz")
md5sums=('a4db0f1b9bf6fd9699d13366e15305b9'
         'ac2554dfd26c354f4e82860ab6a37089')

build() {
  cd "$srcdir"/me091011/src
  sed -i.bak -e '74d' -e'69,72d' linux26.gmk #Make sure we use ncurses
  make -f linux26.gmk
}

package() {
  cd "$srcdir"/me091011/src
  mkdir -p $pkgdir/usr/bin
  make -f linux26.gmk INSTDIR="$pkgdir"/usr/bin install
  cp linux26.gmk.bak linux26.gmk
  cd "$srcdir"
  # Install supporting files
  install -d -o root -g root -m 0755 \
    "$pkgdir"/usr/share/jasspa/{company,contrib,macros,spelling} "$pkgdir"/usr/share/pixmaps
  install -o root -g root -m 0644 -t "$pkgdir"/usr/share/pixmaps jasspa/pixmaps/*
  install -o root -g root -m 0644 -t "$pkgdir"/usr/share/jasspa/company jasspa/company/*
  install -o root -g root -m 0644 -t "$pkgdir"/usr/share/jasspa/contrib jasspa/contrib/*
  install -o root -g root -m 0644 -t "$pkgdir"/usr/share/jasspa/macros jasspa/macros/*
  install -o root -g root -m 0644 -t "$pkgdir"/usr/share/jasspa/spelling jasspa/spelling/*
}

