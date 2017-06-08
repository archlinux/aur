# Maintainer: Bachir Soussi Chiadmi (bach at figureslibres dot io)

pkgname=cascade-git
pkgver=0.1.alpha.r10.bc13b7f
pkgrel=1
pkgdesc="PyQt5 based appliaction for writing and layout printed documents."
arch=('any')
url="https://figureslibres.io/gogs/bachir/Cascade"
license=('AGPL')
depends=('python' 'python-pyqt5' 'python-markdown' 'python-pygit2' 'python-beautifulsoup4' 'pandoc' 'python-pypandoc' 'python-pygments' 'qt5-base' 'python-setuptools' 'desktop-file-utils')

# needs custom build of 'qt5-webkit-ng'
makedepends=('coreutils' 'git' 'python' 'python-setuptools')
# provides=('cascade')
source=('git+https://figureslibres.io/gogs/bachir/Cascade.git' 'cascade.desktop' 'cascade.png')
md5sums=('SKIP' '63639eecc6831a5b19b2a5d943e615a1' 'd2de8e22b3f16a03c393dc1b8878fb48')
# conflicts=("")

pkgver() {
	cd "$srcdir/Cascade"
	# without tags
	# printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	# with tags
	git describe --long --tags| sed 's/^v//g;s/\([^-]*-\)g/r\1/;s/-/./g'

}

# todo : do i need to build ? i think no
# build() {
# 	# cd "$srcdir/tools.ospkit/src/"
# 	# qmake
# 	# make
# }

package() {
	mkdir -p "$pkgdir/usr/share/applications"
	install -Dm644 cascade.desktop "$pkgdir/usr/share/applications/cascade.desktop"
	mkdir -p "$pkgdir/usr/share/pixmaps"
	install -Dm644 cascade.png "$pkgdir/usr/share/pixmaps/cascade.png"

	# PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps sass pyphen
	# python -O -m compileall "${pkgdir}/path/to/module"

	cd "$srcdir/Cascade"
  python setup.py install --root="$pkgdir/" --optimize=1
	# --prefix=/usr/local/
}
