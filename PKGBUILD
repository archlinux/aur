# Maintainer: noirscape <deepnavy at waifu dot club>
pkgname=fatattr-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=1
pkgrel=2
pkgdesc="Small linux application to see or modify MSDOS attributes in a FAT file system"
arch=("any")
url="https://github.com/Terseus/fatattr"
license=('GPL')
depends=()
makedepends=('git' 'scons' 'clang') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("fatattr")
conflicts=("fatattr")
source=("$pkgname"::'git+https://github.com/Terseus/fatattr.git#branch=master')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-VCS}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-VCS}"
        scons
}
package() {
	cd "$srcdir/${pkgname%-VCS}"
	mkdir -p "$pkgdir"/usr/bin
	install -Dm755 "bin/fatattr" "$pkgdir"/usr/bin
}