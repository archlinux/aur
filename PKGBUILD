# Maintainer: SebRmv <sbriais at-symbol free dot fr>
pkgname=omake-git
pkgver=r328.988b2a7
pkgrel=2
pkgdesc="A build system designed for scalability and portability"
arch=('i686' 'x86_64')
url=http://projects.camlcity.org/projects/omake.html
license=('GPL')
depends=('ncurses' 'readline')
makedepends=('git' 'gcc' 'ocaml')
provides=('omake')
conflicts=('omake')
source=('omake::git+https://github.com/ocaml-omake/omake.git')
sha1sums=(SKIP)

_gitname='omake'

build() {
  msg "Starting build..."

  cd "$srcdir"
  rm -rf "$_gitname-build"
  cp -r "$_gitname" "$_gitname-build"

  cd "$_gitname-build"

  ./configure --prefix /usr && make
}

package() {
  cd "$srcdir/$_gitname-build"
  mkdir -p $pkgdir/opt/omake
  make INSTALL_ROOT="$pkgdir" install
}

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
