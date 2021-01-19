# Maintainer: jiahuiz <jiahuizhuo1998@gmail.com>


pkgname=labelimg-git
_gitname=labelImg
pkgver=r383.ebb2b83
pkgrel=1
pkgdesc="A graphical image annotation tool."
arch=('i686' 'x86_64')
url="https://github.com/tzutalin/labelImg"
license=('MIT')
groups=()
depends=('python-pyqt5' 'python' 'python-lxml')
optdepends=()
makedepends=('git')
backup=()

source=(
	'git+https://github.com/tzutalin/labelImg'
	'labelImg.desktop'
) 

md5sums=(
	'SKIP'
	'3214f42c0bc60414180e0eb599332931'
)

pkgver() {
	cd "$srcdir/$_gitname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build(){
	cd "$srcdir/$_gitname"
	make qt5py3
}

package() {
	cd "$srcdir/$_gitname"

	# Configure version
	sed -i "s#NowVersion#${pkgver}#" $srcdir/$_gitname.desktop

	# Create destination folder
	mkdir -p $pkgdir/opt/${pkgname%-git}

	# Installa all programs
	cp -rf * $pkgdir/opt/${pkgname%-git}/

	# Installa desktop file
	mkdir -p $pkgdir/usr/share/applications
	install -Dm644 $srcdir/$_gitname.desktop $pkgdir/usr/share/applications/$_gitname.desktop

	# Install licenses
	install -Dm644 $srcdir/$_gitname/LICENSE "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
	
}

