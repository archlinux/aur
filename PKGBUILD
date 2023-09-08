# Maintainer: Marco Rubin <marco.rubin@protonmail.com>
# Contributor: spelufo <santiagopelufo@gmail.com>
# Contributor: Snowball <excitablesnowball@gmail.com>

pkgname=scmutils
pkgver=20230902
pkgrel=1
pkgdesc="Scheme library for the book Structure and Interpretation of Classical Mechanics."
arch=('x86_64')
url="http://mitpress.mit.edu/sicm/"
license=('GPL2')
depends=('mit-scheme')
source=("https://groups.csail.mit.edu/mac/users/gjs/6946/mechanics-system-installation/native-code/$pkgname-$pkgver.tar.gz")
b2sums=('06da3a3ca60b09a2c318004749ef3ba3041b05df8cb15289f55fca361ec7e301887b6139d6335de1f4b87073a7fb14b58c8c67fb15eba16b301b318655d18e8e')

package() {
	cd $pkgname-$pkgver

	target="$pkgdir/$(mit-scheme --batch-mode --no-init-file --eval "(write-string (->namestring (system-library-directory-pathname)))" "(exit)")"
	install -Dm644 mechanics.com "$target/mechanics.com"
	for src in $(find * -type f -name '*.bci'); do
		install -Dm644 $src "$target/$src"
	done

	install -Dm755 mechanics.sh "$pkgdir/usr/bin/mechanics"

	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
