# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>

# This package must not by "any" arch.
# Requires rebuild with every change to sdl-config

pkgname=perl-alien-sdl
_realname=Alien-SDL
pkgver=1.446
pkgrel=12
pkgdesc="Building, finding and using SDL binaries"
arch=(x86_64)
license=(PerlArtistic GPL)
url="https://metacpan.org/dist/$_realname"
depends=(sdl perl-file-sharedir perl-capture-tiny)
makedepends=(perl-file-which perl-text-patch perl-archive-extract perl-archive-zip perl-module-build)
options=(!emptydirs)
source=("https://cpan.metacpan.org/authors/id/F/FR/FROGGS/$_realname-$pkgver.tar.gz")
sha256sums=('c9aa2c9dc3c63d89773c7d7203f2a46d1b924d0c72d9f801af147a3dc8bc512a')

prepare() {
  cd $_realname-$pkgver

  # Workaround bug with --with-sdl-config
  sed -i '/^GetOptions/d' Build.PL
}

build() {
  cd $_realname-$pkgver

  # install module in vendor directories
  perl Build.PL --with-sdl-config
  perl Build
}

package() {
  cd $_realname-$pkgver
  perl Build install installdirs=vendor destdir="$pkgdir"
}

# vim:set sw=2 et:
