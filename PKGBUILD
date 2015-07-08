# $Id: PKGBUILD 225278 2014-10-24 18:25:28Z dreisner $
# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>

pkgname=ctags-git
_pkgname=ctags
pkgver=r2361.b3f670c
pkgrel=1
pkgdesc="Generates an index file of language objects found in source files"
arch=('i686' 'x86_64')
url="http://ctags.io"
license=('GPLv2')
depends=('glibc')
makedepends=('git')
provides=('ctags')
conflicts=('ctags')
source=("${_pkgname}::git+https://github.com/universal-ctags/ctags.git")
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_pkgname}

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${srcdir}/${_pkgname}

  autoreconf -f -i -v
  ./configure --prefix=/usr \
              --disable-external-sort
  make
}

package() {
  cd ${srcdir}/${_pkgname}

  make prefix=${pkgdir}/usr install
}
