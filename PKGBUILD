# Maintainer: Coelacanthus <coelacanthus@outlook.com>

pkgname=rime-liangfen
pkgver=4.0
#_commit=a67ea69d45c2785048ad05b1639d9f01ad5a01f0
pkgrel=1
pkgdesc="LiangFen by Sim CheonHyeong"
arch=('any')
url="http://cheonhyeong.com/Simplified/download.html"
license=('custom')
# dependency for reverse lookup
depends=('rime-prelude')
makedepends=('librime')
source=("http://cheonhyeong.com/File/ZHLF_rime_$pkgver.7z")
b2sums=('49f36577774a44f36c1946aed06a6dd00e1f9b3a9186d182bdda338fafdb222635ba76cc68107ecbd778870b719ee955c5abffa6a582aa05121fb128a3fad7fd')

prepare() {
	cd $srcdir
	# Link essentials
	for _f in $(pacman -Qql rime-prelude | grep -v "/$"); do ln -sf $_f; done
}

build() {
	cd $srcdir
	for _s in $(ls *.schema.yaml); do rime_deployer --compile $_s; done
}

package() {
	cd $srcdir
	find . -type l -delete
	rm build/*.txt
	install -Dm644 *.yaml -t "$pkgdir"/usr/share/rime-data/
	install -Dm644 build/* -t "$pkgdir"/usr/share/rime-data/build/

	#install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/
}
