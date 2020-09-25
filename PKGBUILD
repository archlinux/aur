# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Your Name <youremail@domain.com>
pkgname=st-supermario9590-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=0.8.4
pkgrel=1
pkgdesc="My custom build of suckless' ST (Simple terminal)"
arch=('i686' 'x86_64')
url="gitlab.com/supermario9590/st-supermario9590"
license=('MIT')
groups=()
depends=('libxft' 'nerd-fonts-mononoki' 'ttf-symbola')
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=(st)
conflicts=(st)
replaces=()
backup=()
options=()
install=
source=("git+$url")
noextract=()
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd st-supermario9590
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd st-supermario9590
	make
}

package() {
	cd st-supermario9590
	mkdir $pkgdir/opt/$pkgname/
	cp -rf * $pkgdir/opt/$pkgname/
	make DESTDIR=$pkgdir/ PREFIX=/usr/ install
	install -m644 -D LICENCE $pkgdir/usr/share/licences/$pkgname
	install -m644 -D README.md $pkgdir/usr/share/doc/$pkgname
}
