# Maintainer: childofunix at gmail dot com

pkgname="rmm-git"
pkgver=1.0.12.r7.gbb3b90e
pkgrel=1
pkgdesc="RimWorld Mod Manager"
arch=("any")
url="https://github.com/Spoons/rmm.git"
license=("GPL")
depends=("steamcmd" "python" "python-beautifulsoup4" "python-tabulate" "python-networkx") 
makedepends=("git" "python-setuptools" "python-pip")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
changelog=ChangeLog
source=("$pkgname::git+$url")
md5sums=("SKIP")

pkgver() {
	cd "${srcdir}/${pkgname}"
    git describe --tags | sed "s/^v//;s/\([^-]*-g\)/r\1/;s/-/./g"
}

build() {
	cd "${srcdir}/${pkgname}"
	python setup.py build
}

package() {
	cd "${srcdir}/${pkgname}"
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm 644 ChangeLog -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm 755 comp/_rmm -t "$pkgdir/usr/share/zsh/functions/Completion/"
	install -Dm 755 comp/rmm.sh -t "$pkgdir/etc/bash_completion.d/rmm.sh"
}
