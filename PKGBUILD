# Maintainer: phiresky <phireskyde+git@gmail.com>
pkgname=qdirstat
pkgver=1.1
pkgrel=1
pkgdesc="Qt-based directory statistics (KDirStat/K4DirStat without any KDE - from the original KDirStat author)"
arch=(i686 x86_64)
url="https://github.com/shundhammer/qdirstat"
license=('GPL2')
groups=()
depends=('qt5-base' 'xdg-utils' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('git')
provides=("${pkgname}-git")
conflicts=("${pkgname}-git")
replaces=()
backup=()
options=()
install=qdirstat.install
source=('git+https://github.com/shundhammer/qdirstat')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"

# Git, tags available
	printf "%s" "$(git describe --tags --abbrev=0)"
}

prepare() {
	cd "$srcdir/$pkgname"
	git checkout "tags/$(git describe --tags --abbrev=0)"
}

build() {
	cd "$srcdir/$pkgname"
	qmake
	make -j$(nproc)
}

package() {
	cd "$srcdir/$pkgname"
	make INSTALL_ROOT="$pkgdir/" install
}
