# Maintainer: Imperator Storm <ImperatorStorm11@protonmail.com>
# Contributor: Johannes Dewender  arch at JonnyJD dot net
pkgname=dh-autoreconf
pkgver=21
pkgrel=2
pkgdesc="debhelper add-on to call autoreconf and clean up after the build"
arch=('any')
url="https://packages.debian.org/sid/dh-autoreconf"
license=('GPL')
depends=('debhelper' 'perl' 'autoconf' 'automake' 'gettext' 'libtool')
source=(https://deb.debian.org/debian/pool/main/d/$pkgname/${pkgname}_$pkgver.tar.xz)
sha256sums=('5cbd797955824105a16eefcafc4a92eacc556372a69de744b504877723a7ab0e')

package() {
#  cd "$srcdir/$pkgname-$pkgver"
  cd "$srcdir/work"
  install -Dm755 "dh_autoreconf" "$pkgdir/usr/bin/dh_autoreconf"
  install -Dm755 "dh_autoreconf_clean" "$pkgdir/usr/bin/dh_autoreconf_clean"
  install -Dm644 autoreconf.pm "$pkgdir/usr/share/perl5/vendor_perl/Debian/Debhelper/Sequence/autoreconf.pm"
  install -Dm644 autoreconf.mk "$pkgdir/usr/share/cdbs/1/rules"
  install -Dm644 ltmain-as-needed.diff "$pkgdir/usr/share/dh-autoreconf"
  mkdir -p "$pkgdir"/usr/share/man/man{1,7}
  pod2man -r "dh-autoreconf v$pkgver" -c dh-autoreconf --section=1 dh_autoreconf "$pkgdir/usr/share/man/man1/dh_autoreconf.1"
  pod2man -r "dh-autoreconf v$pkgver" -c dh-autoreconf --section=1 dh_autoreconf_clean "$pkgdir/usr/share/man/man1/dh_autoreconf_clean.1"
  pod2man -r "dh-autoreconf v$pkgver" -c dh-autoreconf --section=7 dh-autoreconf.pod "$pkgdir/usr/share/man/man7/dh-autoreconf.7"
}

# vim:set ts=2 sw=2 et:
