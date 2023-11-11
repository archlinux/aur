# Maintainer: Yvaniak <ewen at philippot dot biz>
# Contributor: BenObiWan <benobiwan @t gmail dot com>
pkgname=zsxd-git
pkgver=785.823b6a1
pkgrel=1
epoch=
pkgdesc="Free and opensource, amateur Zelda game with humoristic characters."
arch=('any')
url="http://www.zelda-solarus.com/"
license=('custom')
groups=()
depends=('solarus-git')
makedepends=('git' 'cmake' 'zip' )
checkdepends=()
optdepends=()
provides=('zsxd')
conflicts=('zsxd')
backup=()
options=()
install=
changelog=
source=("$pkgname"::'git+https://gitlab.com/solarus-games/games/zsxd.git#branch=master')
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"

  cmake -D CMAKE_INSTALL_PREFIX="/usr" -D CMAKE_BUILD_TYPE=Release .
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}/" PREFIX="/usr" install
}
