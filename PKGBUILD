# Maintainer: Felipe Martin <me@fmartingr.com>

pkgname="conrad-venv-bin"
pkgver="0.2.0"
pkgrel="4"
pkgdesc="conrad helps you track conferences and meetups on your terminal! [installed inside a virtualenv to prevent depedencies directly on the system]"
arch=('i686' 'x86_64')
url="https://github.com/vinayak-mehta/conrad"
license=('MIT')
depends=('python' 'python-virtualenv' 'python-pip' )
optdepends=()
conflicts=()
source=()
md5sums=()


prepare() {
	mkdir -p "$srcdir/conrad-venv-bin"
	cd "$srcdir/conrad-venv-bin" || exit
	python3 -m venv venv
	source venv/bin/activate
	pip install conference-radar==0.2.0
}

package() {
	mkdir "$pkgdir/opt"
	cp -r "$srcdir/conrad-venv-bin" "$pkgdir/opt/conrad-venv-bin"
	cd "$pkgdir/" || exit
	mkdir -p usr/local/bin
	ln -s "/opt/conrad-venv-bin/venv/bin/conrad" "$pkgdir/usr/local/bin/conrad"
	sed -i "1s/.*/#!\/opt\/conrad-venv-bin\/venv\/bin\/python/" "opt/conrad-venv-bin/venv/bin/conrad"
}
