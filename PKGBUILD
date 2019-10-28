# Maintainer: Reik Keutterling <spielkind@gmail.com>
# Contributor: Bryan Ischo <bryan@ischo.com>
pkgname=libs3-git
_gitname=libs3
pkgver=278.287e4be
pkgrel=1
pkgdesc="C Library and Tools for Amazon S3 Access"
arch=('i686' 'x86_64')
url="https://github.com/bji/libs3"
license=('GPL')
groups=()
depends=('libxml2' 'openssl' 'curl')
makedepends=('make' 'libxml2' 'openssl' 'curl')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("git://github.com/bji/${_gitname}.git#commit=287e4bee6fd430ffb52604049de80a27a77ff6b4"
        'added_s3_versioning_support.patch')
noextract=()
sha256sums=('SKIP'
            '0549154da30ef026b334a83cb69e168f7bb243a17569f54bbc57f0840d76f8c2')



prepare() {
 cd "$_gitname"
 # https://github.com/bji/libs3/pull/70
 patch -Np1 -i "${srcdir}/added_s3_versioning_support.patch"
}

pkgver() {
  cd "$_gitname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd "$_gitname"
  CFLAGS="-Wno-stringop-overflow -Wno-format-truncation" DESTDIR=$pkgdir/usr make install || return 1
}
