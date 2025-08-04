# Maintainer:  Oliver Kahrmann <oliver.kahrmann at gmail dot com>
# Contributor: Dan McCurry <dan.mccurry at linux dot com>

pkgname=oh-brother-git
pkgver=r60.d7cd5b0
pkgrel=2
pkgdesc="A simple cross-platform utility written in Python which can update Brother printer firmwares."
arch=('any')
url="https://github.com/CauldronDevelopmentLLC/oh-brother"
license=('GPL2')
makedepends=('git')
depends=(
	'python-pysnmplib'
	'python-pyasyncore'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(
	"1-importlib.patch"
	"${pkgname%-git}::git+https://github.com/CauldronDevelopmentLLC/oh-brother.git"
)
sha256sums=(
	'c6b5147f51157fbe4942580bcc0f1c2cdbf1458a0d06dedf2f5ca4d93509b57c'
	'SKIP'
)

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
    patch -Np1 -i ../1-importlib.patch
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm755 "oh-brother.py" "${pkgdir}/usr/bin/oh-brother"
}
