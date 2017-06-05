
# Maintainer: Bachir Soussi Chiadmi (scbh at g-u-i dot me)
pkgname=cascade-git
pkgver=r19.7fe30da
pkgrel=1
pkgdesc="PyQt5 based appliaction for writing and layout printings."
arch=('any')
url="https://figureslibres.io/gogs/bachir/Cascade"
license=('AGPL')
depends=('python' 'python-pyqt5' 'python-pigments' 'python-markdown' 'python-pygit2' 'python-beautifulsoup4' 'pandoc' 'python-pypandoc' 'qt5-base' 'qt5-webkit-ng' 'python-setuptools' 'desktop-file-utils')
# pip package, how to do that ?
# 'sass' 'pyphen' 'pygments-stye-monokailight' 'pygments-stye-monokai-hcb'

makedepends=('git')
provides=('cascade')
source=('git+https://figureslibres.io/gogs/bachir/Cascade.git' 'cascade.desktop' 'cascade.png' 'Screenshot_stackcontents.png' 'Screenshot_stackdesign.png')
md5sums=('SKIP' 'd1a8974b81ce913c816b6ff1bd329299' 'd2de8e22b3f16a03c393dc1b8878fb48' '0939e1477071b317704ef2d4744c5828' 'dc30dcfb4fb085ecb5dd46416d819221')
conflicts=("")

pkgver() {
	cd "$srcdir/tools.cascade"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# build() {
# 	# cd "$srcdir/tools.ospkit/src/"
# 	# qmake
# 	# make
# }

package() {
	mkdir -p "$pkgdir/usr/local/bin"
	install "$srcdir/tools.cascade/src/OSPKit" "$pkgdir/usr/bin/ospkit"
	mkdir -p "$pkgdir/usr/share/applications"
	install -Dm644 cascade.desktop "$pkgdir/usr/share/applications/cascade.desktop"
	mkdir -p "$pkgdir/usr/share/pixmaps"
	install -Dm644 ospkit.png "$pkgdir/usr/share/pixmaps/cascade.png"
}
