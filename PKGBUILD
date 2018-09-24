# Contributor: Johannes Dewender  arch at JonnyJD dot net
pkgname=dh-autoreconf
pkgver=19
pkgrel=1
pkgdesc="debhelper add-on to call autoreconf and clean up after the build"
arch=('any')
url="http://packages.debian.org/sid/dh-autoreconf"
license=('GPL')
depends=('debhelper' 'perl' 'autoconf' 'automake' 'gettext' 'libtool')
source=(https://deb.debian.org/debian/pool/main/d/$pkgname/${pkgname}_$pkgver.tar.xz)
sha256sums=('d6d7feb73c9a762a6eb93d407e33cbe056cfcea9aca14bef2121037b1a9e18fb')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D "dh_autoreconf" "$pkgdir/usr/bin/dh_autoreconf"
  install -D "dh_autoreconf_clean" "$pkgdir/usr/bin/dh_autoreconf_clean"
  install -D -m 644 autoreconf.pm \
    "$pkgdir/usr/share/perl5/vendor_perl/Debian/Debhelper/Sequence/autoreconf.pm"
  # man pages
  mkdir -p "$pkgdir"/usr/share/man/man{1,7}
  pod2man_func --section=1 dh_autoreconf "$pkgdir"/usr/share/man/man1/dh_autoreconf.1
  pod2man_func --section=1 dh_autoreconf_clean "$pkgdir"/usr/share/man/man1/dh_autoreconf_clean.1
  pod2man_func --section=7 dh-autoreconf.pod "$pkgdir"/usr/share/man/man7/dh-autoreconf.7
}

pod2man_func() {
  pod2man -r "dh-autoreconf v$pkgver" -c dh-autoreconf $@
}

# vim:set ts=2 sw=2 et:
