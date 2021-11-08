# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgbase=svetovid-lib
pkgname=(svetovid-lib svetovid-lib-doc)
pkgver=0.5.1
_commit=a14c0bd96d5a57c24ad227872ed4a44d1d778e5e
pkgrel=1
pkgdesc='Supplement Library for Introductory Programming Courses'
arch=(any)
url=https://github.com/ivanpribela/svetovid-lib
license=(APACHE)
depends=(java-runtime)
makedepends=(ant inkscape git)
source=("git+https://github.com/ivanpribela/svetovid-lib#commit=$_commit")
sha512sums=(SKIP)

build() {
	cd "$pkgname"

	ant pack.jar
	ant generate.apidoc
}

package_svetovid-lib() {
	cd "$pkgname"

	install -Dm644 "dist/$pkgname.jar" -t "$pkgdir/usr/share/java"

	install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 "NOTICE" -t "$pkgdir/usr/share/licenses/$pkgname"
}

package_svetovid-lib-doc() {
	cd "$pkgbase"

	install -d "$pkgdir/usr/share/doc"
	cp -a "gendoc/api" "$pkgdir/usr/share/doc/$pkgbase"
}
