# Maintainer: Marius Orcsik <marius@littr.me>
pkgname=orion-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=r205.3339da5
pkgrel=1
pkgdesc="QML/C++-written desktop client for Twitch.tv"
arch=('x86_64' 'x86')
url="https://github.com/alamminsalo/orion"
license=('GPL')
groups=()
depends=('libcommuni-git')
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/alamminsalo/orion.git')
noextract=()
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-git}"

# Git, tags available
	#printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
    mkdir "build" && cd "./build"
    qmake ../
	make
}

package() {
	cp -r "$srcdir/${pkgname%-git}" "$pkgdir" 
}
