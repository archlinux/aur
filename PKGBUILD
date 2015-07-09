# Contributor: Blaž Tomažič <blaz.tomazic@gmail.com>

pkgname=clamtk
pkgver=5.19
pkgrel=1
pkgdesc="GUI front-end for ClamAV using Perl and Gtk libraries. It is designed to be an easy-to-use, on-demand scanner for Linux systems."
arch=('any')
url="http://code.google.com/p/clamtk/"
license=('GPL')
depends=('clamav' 'perl' 'gtk2-perl' 'perl-locale-gettext' 'perl-libwww' 'perl-http-message' 'perl-lwp-protocol-https' 'perl-text-csv' 'perl-json' 'python' 'zenity')
install='clamtk.install'
source=("https://bitbucket.org/dave_theunsub/$pkgname/downloads/$pkgname-$pkgver.tar.gz")
sha512sums=('2e060e63857468e98e7c80d96dde952ecd51288e14047dba425cdb8116a12866fddd34f057cbde54d35f0a2ca949553388a847416bbf2cf50869d4439454292d')

build() {
  return 0
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # executable
  install -Dm755  clamtk $pkgdir/usr/bin/clamtk
  
  # libs
  for n in lib/* ; do
	  install -Dm644 $n $pkgdir/usr/lib/perl5/vendor_perl/ClamTk/`basename $n`
  done
  
  # localization
  for n in po/*.mo ; do
	  install -Dm644 $n $pkgdir/usr/share/locale/`basename $n .mo`/LC_MESSAGES/clamtk.mo
  done
  
  # man pages
  install -Dm644 clamtk.1.gz $pkgdir/usr/share/man/man1/clamtk.1.gz
  
  # doc
  install -Dm644 CHANGES $pkgdir/usr/share/doc/$pkgname/CHANGES
  install -Dm644 DISCLAIMER $pkgdir/usr/share/doc/$pkgname/DISCLAIMER
  install -Dm644 LICENSE $pkgdir/usr/share/doc/$pkgname/LICENSE
  install -Dm644 README $pkgdir/usr/share/doc/$pkgname/README
  
  # help
  install -dm755 $pkgdir/usr/share/help/
  cp -dr --no-preserve=ownership help/* $pkgdir/usr/share/help/
  
  # pixmaps
  install -Dm644 images/clamtk.xpm $pkgdir/usr/share/pixmaps/clamtk.xpm
  install -Dm644 images/clamtk.png $pkgdir/usr/share/pixmaps/clamtk.png
  
  # menu
  install -Dm644  clamtk.desktop $pkgdir/usr/share/applications/clamtk.desktop
  
  # nautilus
  # install -Dm755  clamtk.py $pkgdir/usr/share/nautilus-python/extensions/clamtk.py
}

# vim:set ts=2 sw=2 et:
