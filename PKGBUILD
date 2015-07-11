# Maintainer: Albert Berger < nbdspcl at gmail dot com>
pkgname=regd-git
pkgver=VERSION
pkgrel=1
pkgdesc="Registry daemon, information cache and secure credential storage."
arch=('any')
url="https://github.com/nbdsp/regd"
license=('GPL')
groups=()
depends=('python>=3.3','git')
optdepends=()
makedepends=()
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("${pkgname%-git}::git+$url#branch=master")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"

	printf "%s" "$(git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
	cd "${pkgname%-git}-${pkgver}"
	python setup.py install --root="$pkgdir/" --optimize=1
	install -Dm644 -o $_username "data/conf.${pkgname}" "$pkgdir/etc/${pkgname}/conf.${pkgname}"
	install -Dm644 -o $_username "data/${pkgname}.1" "$pkgdir/usr/share/man/man1/${pkgname}.1"
}
