# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Thomas Pulzer <t.pulzer at thesecretgamer dot de>
pkgname=msigna
pkgver=0.9.6
pkgrel=1
pkgdesc="An interactive desktop application for transacting on the bitcoin network."
arch=('x86_64' 'i686')
url="https://ciphrex.com"
license=('AGPL3' 'MIT')
depends=('qt5-base' 'boost-libs' 'libodb-sqlite' 'qrencode')
makedepends=('qt5-base' 'boost-libs' 'libodb-sqlite' 'qrencode')
optdepends=('bitcoin-qt')
source=("https://github.com/Faldon/mSIGNA/archive/v$pkgver-AUR.tar.gz")

prepare() {
	cd "$srcdir/mSIGNA-$pkgver-AUR"
	sed -i -e "s#PREFIX=#PREFIX=$pkgdir/usr#g" build-all.sh
	sed -i -e "s#VERSION=#VERSION=$pkgver#g" "mSIGNA.desktop"
	sed -i -e "s#COMMENT=#COMMENT=$pkgdesc#g" "mSIGNA.desktop"
}

build() {
	cd "mSIGNA-$pkgver-AUR"
	./build-all.sh linux
}

package() {
	cd "mSIGNA-$pkgver-AUR"
	make install
}
md5sums=('bc4323729906ce76b8600065189c762e')
