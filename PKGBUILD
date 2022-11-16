# Maintainer: Vincent Lee < vincent at vincent dash lee dot net >
_realname=sapling  # Already taken on AUR
pkgname="$_realname-scm"
_realver=20221115-080554-34470671
pkgver="${_realver//-/.}"  # dashes aren't allowed in pkgver
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
sha256sums=("93f60a05e049f8eb0e1c73f32a4ad75f8eb2d2a12972ed057c080459a564fc75")

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
