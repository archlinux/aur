# Maintainer:  benutzer193 <registerbn+arch a_t gmail d_ot com>
pkgname=flips-git
_pkgname='Flips'
pkgver=r56.d95c34c
pkgrel=1
pkgdesc="Patcher for IPS and BPS files"
arch=('any')
url="https://github.com/Alcaro/Flips"
license=('GPL3')
optdepends=('gtk3: GUI support')
makedepends=('git')
provides=('flips')
conflicts=('flips')
source=("git://github.com/Alcaro/Flips.git")
install=flips.install
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)"\
    "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"

  # do not tread warnings as errors
  sed -e "s/\-Werror//g" -i ./make.sh

  # profile=yes --> use profile-guided optimization (requires 100MB training corpus)
  ./make.sh --profile=no --harden=no
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 "flips" "$pkgdir/usr/bin/flips"
}
