# Maintainer: Dan McCurry <dan.mccurry at linux dot com>
# Contributor: Oliver Kahrmann <oliver.kahrmann@gmail.com>

pkgname=oh-brother-git
pkgver=r39.e667fe7
pkgrel=2
pkgdesc="A simple cross-platform utility written in Python which can update Brother printer firmwares."
arch=('any')
url="https://github.com/CauldronDevelopmentLLC/oh-brother"
license=('GPL2')
makedepends=('git')
depends=('python-pyasn1' 'python-pysnmp' 'python-future')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/CauldronDevelopmentLLC/oh-brother.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	sed -i '1 s/python/python3/' oh-brother.py
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm755 "oh-brother.py" "${pkgdir}/usr/bin/oh-brother"
}
