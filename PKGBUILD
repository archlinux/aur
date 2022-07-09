# Maintainer: Arthur Poulet (arthur.poulet@sceptique.eu)
pkgname=transfer-more
pkgver=v0.5.6.r0.a31c115
pkgrel=5
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
# source=('transfer_more::git+https://git.sceptique.eu/Sceptique/transfer_more')
source=('transfer_more_v0.5.6.tar.gz::https://git.sceptique.eu/Sceptique/transfer_more/archive/v0.5.6.tar.gz')
noextract=()
sha256sums=('0d60e7d8332efa8b0022db1b66a20d0ac7e2574b048a71a5fe1bbd07b25b4dc2')

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
  make PREFIX="$pkgdir/usr/share" NAME="transfer-more" install
}
