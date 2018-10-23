# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Finn Behrens <finn@dsgvo.fail>
pkgname=mantags-git 
pkgver=0.1.1
pkgrel=1
pkgdesc="Parses man file to ctags for autocompletion"
arch=('any')
url="https://github.com/Jugendhackt/configfoo"
license=('GPL3')
groups=()
depends=('python' 'man')
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("mantags")
conflicts=("mantags")
replaces=()
backup=()
options=()
source=('mantags::git+https://github.com/Jugendhackt/configfoo.git')
noextract=()
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/mantags"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
	cd "$srcdir/mantags"
	install -Dm0755 mantags "$pkgdir/usr/bin/mantags"
	install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm0644 .vimrc "$pkgdir/usr/share/vim/vimfiles/plugin/mantags.vim"
	install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
