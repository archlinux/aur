# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: Baptiste Jonglez <baptiste--aur at jonglez dot org>
pkgname=jbofihe-git
pkgver=20030418.22.g893dd52
epoch=1
pkgrel=1
pkgdesc="Tools to operate on Lojban text (main feature: approximate translation to English)."
arch=('i686' 'x86_64')
url="https://github.com/spider-mario/jbofihe"
license=('GPL2')
depends=('glibc')
makedepends=('git' 'perl')
options=('!makeflags')
source=(git+https://github.com/spider-mario/jbofihe)
sha512sums=(SKIP)

pkgver() {
  cd jbofihe
  git describe --tags | sed -e 's/^[^0-9\-]*//' -e 'y/-/./'
}

build() {
  cd jbofihe

  msg "Running config.pl..."

  perl config.pl --prefix=/usr

  msg "Running make..."

  # There is a Perl script that expects the locale to be an English one.
  LC_ALL=C make all
}

package() {
  cd jbofihe
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
