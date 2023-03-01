# Maintainer: Vincent Lee < vincent at vincent dash lee dot net >
_realname=sapling  # Already taken on AUR
pkgname="$_realname-scm"
_realver=0.2.20230228-144002-h9440b05e
pkgver="${_realver//-/.}"  # dashes aren't allowed in pkgver
epoch=1  # Version scheme was changed from YYYYMMDD-.... to prepend a number: 0.1-YYYYMMDD-...
pkgrel=1
pkgdesc="A Scalable, User-Friendly Source Control System"
arch=("x86_64")
url="https://sapling-scm.com"
license=('GPL2')
provides=("$pkgname")
depends=('curl' 'nodejs' 'python')
# NOTE: namcap(1) reports various missing python libs from scanning the package, but
#  this binary actually vendors them in. The resulting sl(1)
#  program runs fine without those libraries installed systemwide.
makedepends=("cargo" "cmake" "rust" "yarn")
optdepends=("github-cli: for integration with GitHub")
source=("https://github.com/facebook/sapling/archive/refs/tags/$_realver.tar.gz")
sha256sums=('70483afad6d0b437cb755447120a34b1996ec09a7e835b40ac8cccdfe44e4b90')

prepare() {
	cd "$_realname-$_realver"
}

build() {
	cd "$_realname-$_realver/eden/scm"
	# TODO `make install-oss` rebuilds the entire project, rendering `make oss`
	# pointless currently. See https://github.com/facebook/sapling/issues/161 for more info.
	# make PREFIX=/usr oss
}

check() {
	cd "$_realname-$_realver"
}

package() {
	cd "$_realname-$_realver/eden/scm"
	make PREFIX=/usr DESTDIR="$pkgdir/" install-oss
}

