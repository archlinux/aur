# Maintainer: Vincent Lee < vincent at vincent dash lee dot net >
_realname=sapling  # Already taken on AUR
pkgname="$_realname-scm"
_realver=0.1.20221118-210929-cfbb68aa
pkgver="${_realver//-/.}"  # dashes aren't allowed in pkgver
epoch=1  # Version scheme was changed from YYYYMMDD-.... to prepend a number: 0.1-YYYYMMDD-...
pkgrel=1
pkgdesc="A Scalable, User-Friendly Source Control System"
arch=("x86_64")
url="https://sapling-scm.com"
license=('GPL2')
depends=("nodejs" "python")
# NOTE: namcap(1) reports various missing python libs from scanning the package, but
#  this binary actually vendors them in. The resulting sl(1)
#  program runs fine without those libraries installed systemwide.
makedepends=("cargo" "cmake" "rust" "yarn")
source=("https://github.com/facebook/sapling/archive/refs/tags/$_realver.tar.gz")
sha256sums=("51ce336f1eb382e591a7384d0292cb41fafbbd92cc701ee74b50099beece65e4")

prepare() {
	cd "$_realname-$_realver"
}

build() {
	cd "$_realname-$_realver/eden/scm"
	make PREFIX=/usr oss
}

check() {
	cd "$_realname-$_realver"
}

package() {
	cd "$_realname-$_realver/eden/scm"
	make PREFIX=/usr DESTDIR="$pkgdir/" install-oss
}
