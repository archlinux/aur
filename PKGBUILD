# Maintainer: Jake <aur@ja-ke.tech>
pkgname=cncjs
pkgver=1.9.15
pkgrel=1
pkgdesc="Web-based interface for CNC controllers running Grbl, Marlin, Smoothieware, or TinyG."
arch=("x86_64")
url="https://github.com/cncjs/cncjs"
license=('MIT')
depends=('nodejs')
makedepends=('yarn')
source=("https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz"
        "cnc")
sha512sums=('03dba4ea59e518d051878afae8695e694d6dc8ce628484d401a479cf9a2ee7af1e501e0d202004258183626b9b1ddadc0b5b1f2fb9bc4466b2331b85176c40ff'
            'cf883eda1afc89fb4d994da8a3ac7b1fdcf7bfbaded163d87b68ccca141c6077b4b8bb107f0379f3ed16ea840a94d5666bc04f163ee2cc3ad5bc457228d0b9a5')

prepare() {
    cd "$pkgname-$pkgver"
    sed -i "s#./sessions#/tmp/sessions#" src/app/app.js # Fix issues/319
}

build() {
	cd "$pkgname-$pkgver"
	yarn install
	cd dist/cnc/
	yarn install
}

package() {
        install -Dm 755 "${srcdir}/cnc" "${pkgdir}/usr/bin/$pkgname"
	cd "$pkgname-$pkgver"
        install -d "${pkgdir}/usr/lib/"
        cp -r dist/cnc/ "${pkgdir}/usr/lib/$pkgname/"
}
