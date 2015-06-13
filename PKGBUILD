# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname=listadmin
pkgver=2.40
pkgrel=2
pkgdesc="A command-line interface for Mailman's administrative tasks."
arch=(any)
url="http://heim.ifi.uio.no/kjetilho/hacks/#listadmin"
license=('custom')
depends=('perl-text-reform' 'perl-html-parser' 'perl-crypt-ssleay' 'perl-libwww')
install=
changelog=ChangeLog
source=(http://heim.ifi.uio.no/kjetilho/hacks/$pkgname-$pkgver.tar.gz
        license.txt
        listadmin-discard.patch
        better-language-and-version-support.patch
        dont-write-logfile.patch)
noextract=()
md5sums=('ce68799888803e61e31ca7e8b95f9b94'
         'aacf22b2586d0668dfe1ce4860e7d5f6'
         '3d3c39857c110cf565132ae6a45beb65'
         'c46b98cfe64d8b307a4a387de3c1eaf7'
         'd1d414d6b4fb81832b6468eafb810f2e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p0 < "$srcdir/listadmin-discard.patch"
  patch -p0 < "$srcdir/better-language-and-version-support.patch"
  patch -p0 < "$srcdir/dont-write-logfile.patch"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX="/usr" DESTDIR="$pkgdir/" install

  # license
  install -D -m644 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
