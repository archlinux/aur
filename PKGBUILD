# Maintainer: Dan McCurry <dan.mccurry at linux dot com>
pkgname=oh-brother-git
pkgver=r22.6c73096
pkgrel=1
pkgdesc="A simple cross-platform utility written in Python which can update Brother printer firmwares."
arch=('any')
url="https://github.com/CauldronDevelopmentLLC/oh-brother"
license=('GPL2')
makedepends=('git')
depends=('python2-pyasn1' 'python2-pysnmp')
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
	sed -i '1 s/python/python2/' oh-brother.py
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm755 "oh-brother.py" "${pkgdir}/usr/bin/oh-brother.py"
}
