# Maintainer: Bachir Soussi Chiadmi (scbh at g-u-i dot me)

pkgname=cascade-git
pkgver=r70.6819a26
pkgrel=1
pkgdesc="PyQt5 based appliaction for writing and layout printed documents."
arch=('any')
url="https://figureslibres.io/gogs/bachir/Cascade"
license=('AGPL')
depends=('python' 'python-pyqt5' 'python-markdown' 'python-pygit2' 'python-beautifulsoup4' 'pandoc' 'python-pypandoc' 'qt5-base' 'python-setuptools' 'desktop-file-utils')

# needs custom build of 'qt5-webkit-ng'
# pip package, how to do that ?
# 'sass' 'pyphen'  'python-pigments' 'pygments-stye-monokailight' 'pygments-stye-monokai-hcb'
makedepends=('coreutils' 'git' 'python' 'python-setuptools')
# provides=('cascade')
source=('git+https://figureslibres.io/gogs/bachir/Cascade.git' 'cascade.desktop' 'cascade.png')
md5sums=('SKIP' 'd1a8974b81ce913c816b6ff1bd329299' 'd2de8e22b3f16a03c393dc1b8878fb48')
# conflicts=("")

pkgver() {
	cd "$srcdir/Cascade"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# todo : do i need to build ? i think no
# build() {
# 	# cd "$srcdir/tools.ospkit/src/"
# 	# qmake
# 	# make
# }

package() {
	# mkdir -p "$pkgdir/usr/local/bin"
	# install "$srcdir/tools.cascade/src/OSPKit" "$pkgdir/usr/bin/ospkit"
	# todo how to install all python files of the app ??
	mkdir -p "$pkgdir/usr/share/applications"
	install -Dm644 cascade.desktop "$pkgdir/usr/share/applications/cascade.desktop"
	mkdir -p "$pkgdir/usr/share/pixmaps"
	install -Dm644 cascade.png "$pkgdir/usr/share/pixmaps/cascade.png"

	cd "$srcdir/Cascade"
  python setup.py install --root="$pkgdir/" --optimize=1
}
