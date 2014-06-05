# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=asclock-gtk
pkgver=2.1.10beta
pkgrel=3
pkgdesc="The AfterStep clock dock app - Gtk version"
url="http://www.cs.mun.ca/~gstarkes/wmaker/dockapps/time.html#asclock"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk')
provides=('asclock')
conflicts=('asclock-classic' 'asclock-xlib')
source=("http://www.cs.mun.ca/~gstarkes/wmaker/dockapps/files/$pkgname-$pkgver.tar.gz"
        "asclock.desktop")
md5sums=('afa682d7954cb4d5c443202ffdd04b17'
         '00cbeb63e46bc7c402e20680e0aa1fec')

prepare() {
  cd "$srcdir/$pkgname"
  rm -f default_theme
  ln -s themes/classic default_theme
  for f in default_theme/*.xpm ; do
    sed -e 's,^static ,,' -i $f
  done
  sed -e 's,/usr/local,/usr,g' -i Makefile
  sed -e 's,share/asclock,share/asclock/themes,' -i Makefile
}

build() {
  cd "$srcdir/$pkgname"
  make asclock
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm0755 asclock "$pkgdir/usr/bin/asclock"
  install -d "$pkgdir/usr/share/asclock/themes"
  install -d "$pkgdir/usr/share/asclock/themes/Newstone"
  install -t "$pkgdir/usr/share/asclock/themes/Newstone" themes/Newstone/*
  install -d "$pkgdir/usr/share/asclock/themes/Orb"
  install -t "$pkgdir/usr/share/asclock/themes/Orb" themes/Orb/*
  install -d "$pkgdir/usr/share/asclock/themes/Stone"
  install -t "$pkgdir/usr/share/asclock/themes/Stone" themes/Stone/*
  install -d "$pkgdir/usr/share/asclock/themes/analog"
  install -t "$pkgdir/usr/share/asclock/themes/analog" themes/analog/*
  install -d "$pkgdir/usr/share/asclock/themes/beats"
  install -t "$pkgdir/usr/share/asclock/themes/beats" themes/beats/*
  install -d "$pkgdir/usr/share/asclock/themes/classic"
  install -t "$pkgdir/usr/share/asclock/themes/classic" themes/classic/*
  install -d "$pkgdir/usr/share/asclock/themes/shaped"
  install -t "$pkgdir/usr/share/asclock/themes/shaped" themes/shaped/*
  install -Dm0644 "$srcdir/asclock.desktop" \
    "$pkgdir/usr/share/applications/asclock.desktop"
}

# vim: set sw=2 et:
