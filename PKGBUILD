# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: VargArch <roels.jorick@gmail.com>
# Contributor: zsrkmyn
# Contributor: marsam

pkgname=ctags-git
pkgver=6.1.0.r195.g08e07dc98
pkgrel=1
pkgdesc="Generates an index file of language objects found in source files"
arch=('i686' 'x86_64')
url="https://ctags.io/"
license=('GPL-2.0-or-later')
depends=('glibc' 'jansson' 'libseccomp' 'libseccomp.so' 'libxml2' 'libyaml' 'pcre2')
makedepends=('git' 'python-docutils')
provides=("ctags=$pkgver")
conflicts=('ctags')
source=("git+https://github.com/universal-ctags/ctags.git")
sha256sums=('SKIP')


pkgver() {
  cd "ctags"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "ctags"

  ./autogen.sh
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "ctags"

  #make check
}

package() {
  cd "ctags"

  make DESTDIR="$pkgdir" install
}
