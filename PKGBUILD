# Maintainer: Felipe Martin <me@fmartingr.com>

pkgname="jrnl-venv-bin"
pkgver="2.0.1"
pkgrel="1"
pkgdesc="Collect your thoughts and notes without leaving the command line. [installed inside a virtualenv to prevent depedencies directly on the system]"
arch=('i686' 'x86_64')
url="https://jrnl.sh/"
license=('MIT')
depends=('python' 'python-virtualenv' 'python-pip')
optdepends=('')
conflicts=('')
source=()
md5sums=()


prepare() {
	mkdir -p "$srcdir/jrnl-venv-bin"
	cd "$srcdir/jrnl-venv-bin" || exit
	python3 -m venv venv
	source venv/bin/activate
	pip install jrnl==2.0.1
}

package() {
	mkdir "$pkgdir/opt"
	cp -r "$srcdir/jrnl-venv-bin" "$pkgdir/opt/jrnl-venv-bin"
	cd "$pkgdir/" || exit
	mkdir -p usr/local/bin
	ln -s "/opt/jrnl-venv-bin/venv/bin/jrnl" "$pkgdir/usr/local/bin/jrnl"
	sed -i "1s/.*/#!\/opt\/jrnl-venv-bin\/venv\/bin\/python/" "opt/jrnl-venv-bin/venv/bin/jrnl"
}
