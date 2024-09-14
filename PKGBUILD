# Maintainer:  Michael Kogan <michael dot kogan at gmx dot net>

pkgname=perl-net-dbus-glib
_cpanname=Net-DBus-GLib
pkgver=0.33.0
pkgrel=13.5
pkgdesc="Net::DBus::GLib - Perl extension for the DBus GLib bindings"
arch=('i686' 'x86_64')
url="https://metacpan.org/pod/release/DANBERR/Net-DBus-GLib-$pkgver/lib/Net/DBus/GLib.pm"
license=('GPL' 'PerlArtistic')
depends=('dbus-glib' 'glib-perl' 'perl-net-dbus')
source=("https://cpan.metacpan.org/authors/id/D/DA/DANBERR/Net-DBus-GLib-$pkgver.tar.gz")
md5sums=('d86fac8abef6781e7f652b1062f474ff')
sha1sums=('42e243e09f7406da276c73d91579bf4a3df3fc78')
options=('!emptydirs')

build() {
	cd $_cpanname-$pkgver
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
}
_perl_depends() {
# template start; name=perl-binary-module-dependency; version=1;
if [[ $(find "$pkgdir/usr/lib/perl5/" -name "*.so") ]]; then
	_perlver_min=$(perl -e '$v = $^V->{version}; print $v->[0].".".($v->[1]);')
	_perlver_max=$(perl -e '$v = $^V->{version}; print $v->[0].".".($v->[1]+1);')
	depends+=("perl>=$_perlver_min" "perl<$_perlver_max")
fi
# template end;
}
package() {
	cd $_cpanname-$pkgver
	make DESTDIR="$pkgdir" install
	_perl_depends
}
