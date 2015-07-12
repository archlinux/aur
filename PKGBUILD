# Maintainer: Albert Berger < nbdspcl at gmail dot com>
pkgname=regd-git
pkgver=v0.6.pre0.r17
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

	git describe --long | sed -r 's/-([0-9,a-g,A-G]{7}.*)//' | sed 's/-/./'
}

package() {
	cd "${pkgname%-git}"
	pname="${pkgname%-git}"
	_username="$(id | sed -e 's/[^(]*(\([^)]*\)).*/\1/')"
	python setup.py install --root="$pkgdir/" --optimize=1
	install -Dm644 -o $_username "data/conf.${pname}" "$pkgdir/etc/${pname}/conf.${pname}"
	install -Dm644 -o $_username "data/${pname}.1" "$pkgdir/usr/share/man/man1/${pname}.1"
}
