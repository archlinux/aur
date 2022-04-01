# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>

pkgname=perl-sdl
pkgver=2.548
pkgrel=6
pkgdesc="Simple DirectMedia Layer for Perl"
arch=(x86_64)
license=(LGPL)
url="http://sdl.perl.org"
depends=(perl-alien-sdl perl-tie-simple
         sdl_net sdl_ttf sdl_image sdl_mixer sdl_gfx sdl_pango smpeg)
makedepends=('perl-module-build>=0.40')
options=('!emptydirs')
replaces=(sdl_perl)
conflicts=(sdl_perl)
provides=("sdl_perl=$pkgver")
# https://metacpan.org/release/SDL
_author=FROGGS
source=(https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/SDL-$pkgver.tar.gz)
md5sums=('35faca310f0e246d5cea93a062f054d9')
sha512sums=('bafc49dddb7e592861f822920915c73bf0c5eea3a6c567623b48a2332c7644caf1451e457545e6666adea5e314b23bcd85a3f3a52c770abfd498c0e4c0feae85')

build() {
  cd SDL-$pkgver
  # Perl selects the proper CFLAGS set for binary modules
  unset CFLAGS
  # install module in vendor directories
  perl Build.PL installdirs=vendor
  perl Build
}

check() {
  cd SDL-$pkgver
  perl Build test || true
}

package() {
  cd SDL-$pkgver
  perl Build install destdir="$pkgdir"
}
