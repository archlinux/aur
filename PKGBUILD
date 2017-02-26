# Contributor: Tom Vincent <http://tlvince.com/contact>
# Contributor: Jente Hidskes <hjdskes@gmail.com>
# Maintainer: Patrick Wozniak <hello@patwoz.de>

pkgname=kwakd-git
_gitname=kwakd
pkgver=r12.acdf0e1
pkgrel=1
pkgdesc="A web server serving blank html pages"
url="https://github.com/fetchinson/$_gitname"
arch=('any' )
license=("GPL")
depends=('bash')
makedepends=('git')
conflicts=('kwakd')
source=(
  "git://github.com/fetchinson/${_gitname}.git"
  "${_gitname}.service"
)
install="${_gitname}.install"
sha256sums=(
  'SKIP'
  '5ae20e1ef81436ba5452447c32c46db4d343f08f5abe0aa41076425a9cee4715'
)

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_gitname"
  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd "$_gitname"
  make DESTDIR=$pkgdir install
  install -Dm644 "$srcdir/$_gitname.service" "$pkgdir/usr/lib/systemd/system/$_gitname.service"
}

