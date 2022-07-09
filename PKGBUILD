# Maintainer: Arthur Poulet (arthur.poulet@sceptique.eu)
pkgname=transfer-more
pkgver=v0.5.5.r0.069309c
pkgrel=1
pkgdesc="Fast and lite file upload server (transfer.sh clone), git build."
arch=('any')
url="https://git.sceptique.eu/Sceptique/transfer_more"
license=('GPLv3')
groups=()
depends=()
makedepends=('crystal' 'shards' 'git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=('transfer_more::git+https://git.sceptique.eu/Sceptique/transfer_more')
#source=('transfer_more.tar.gz::http://localhost/transfer_more_pkg/transfer_more.tar.xz')
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/transfer_more"
  printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "$srcdir/transfer_more"
  make NAME="transfer-more" deps release
}

# Note: the package files are supposed to be installed in /usr/bin/share/transfer-more
package() {
  cd "$srcdir/transfer_more"
  mkdir "$pkgdir/usr/share/transfer-more" -p
  make PREFIX="$pkgdir/usr/share/transfer-more" NAME="transfer-more" install
}
