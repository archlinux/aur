# Maintainer: Max Bruckner (FSMaxB)
pkgname=mecab-ipadic
pkgver=2.7.0_20070801
pkgrel=1
pkgdesc="IPA dictionary for mecab."
arch=('any')
url="https://taku910.github.io/mecab"
depends=('mecab')
license=('GPL2')
source=("$pkgname-${pkgver/_/-}.tar.gz::https://drive.google.com/uc?id=0B4y35FiV1wh7MWVlSDBCSXZMTXM&export=download")
sha512sums=('35ea662cb62f1967849f7ed5781bd6dafef0fe20d63e88d9a0057666e57ed23d5a0e6fb8d0701a0cc4da43a1050c1b02463bb862decc71c36b7fc2acdc158d86')

build() {
	cd "$pkgname-${pkgver/_/-}"
	./configure --prefix=/usr
	# change hardcoded mecab installation path
	sed -i 's!libexec/mecab!lib/mecab!g' config.status
	make
}

package() {
	cd "$pkgname-${pkgver/_/-}"
	make DESTDIR="$pkgdir/" install
}
