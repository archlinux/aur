# Maintainer: Malacology <guoyizhang at malacology dot com>
# Contributor: Malacology <guoyizhang at malacology dot com>

pkgname=grobid
pkgver=0.7.0
pkgrel=1
pkgdesc="A machine learning software for extracting information from scholarly documents"
arch=('any')
url="https://github.com/kermitt2/grobid"
conflicts=('grobid-git')
provides=('grobid')
license=('Apache')
depends=(
	'java-runtime<=11'
	'archlinux-java-run'
)
source=("https://github.com/kermitt2/grobid/archive/$pkgver.zip")
sha256sums=('31c48f63d013e7be6731cbc3fa5c872af82d9c9b871ed422bbc5d9fca512297a')
prepare(){
	cd $srcdir
	mkdir build
}
build() {
	cd $srcdir/$pkgname-$pkgver
	chmod +x gradlew
	./gradlew --no-daemon -Dmaven.repo.local="${srcdir}/build" clean install

}

package(){
	install -dDm755 "$pkgdir"/usr/{bin,share/$pkgname}
	cp -r $srcdir/build/org/$pkgname/* $pkgdir/usr/share/$pkgname

}
