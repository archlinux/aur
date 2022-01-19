# Maintainer: bobpaul <aurpackage [at] bobpaul 'period' org>
pkgname="git-crecord-git"
pkgver=20201025.0.r4.gf520edf
pkgrel=1
epoch=
pkgdesc="Git subcommand to interactively select changes to commit or stage"
arch=(any)
url="https://github.com/andrewshadura/git-crecord"
license=('GPL')
groups=()
depends=('python' 'git')
makedepends=('git' 'python-docutils' 'python-setuptools')
checkdepends=()
optdepends=()
provides=()
conflicts=('git-crecord')
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
