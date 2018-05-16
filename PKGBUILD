# Maintainer: bobpaul <aurpackage [at] bobpaul 'period' org>
pkgname="git-crecord-git"
pkgver=20161216.0.r4.g30c7f4c
pkgrel=2
epoch=
pkgdesc="Git subcommand to interactively select changes to commit or stage"
arch=(any)
url="https://github.com/andrewshadura/git-crecord"
license=('GPL')
groups=()
depends=('python2')
makedepends=('git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(git+https://github.com/andrewshadura/git-crecord.git)
noextract=()
md5sums=('SKIP')
validpgpkeys=()

#prepare() {
#	cd "$pkgname-$pkgver"
#	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
#}


builddir="${pkgname/-git/}"
build() {
	cd "$builddir"
    ./setup.py build
}

pkgver(){
	cd "$builddir"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
	cd "$builddir"
    ./setup.py test
}

package() {
	cd "$builddir"
    ./setup.py install --prefix=/usr --root="${pkgdir}" -O1 --skip-build
}
