# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Johannes Arnold <johannes.arnold@stud.uni-hannover.de>
pkgname=wldash-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=r69.92acc7c
pkgrel=1
pkgdesc="Wayland launcher/dashboard"
arch=('x86_64')
url="https://github.com/kennylevinsen/wldash"
license=('GPL3')
groups=()
depends=()
makedepends=('git' 'rust') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/kennylevinsen/wldash.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	cargo build --release
}

package() {
	cd "$srcdir/${pkgname%-git}"
	mkdir -p $pkgdir/usr/bin
	cp target/release/wldash $pkgdir/usr/bin/wldash
}
