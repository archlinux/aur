# Maintainer: bobpaul <aurpackage [at] bobpaul 'period' org>
pkgname="git-crecord-git"
pkgver=20230226.0.r5.g8020a3f
pkgrel=2
epoch=
pkgdesc="Git subcommand to interactively select changes to commit or stage"
arch=(any)
url="https://github.com/andrewshadura/git-crecord"
license=('GPL')
groups=()
depends=('python' 'git')
makedepends=('git' 'python-docutils' 'python-build' 'python-installer' 'python-setuptools' 'python-pytest' 'python-wheel')
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

builddir="${pkgname/-git/}"
prepare() {
	cd "$builddir"
	sed -i 's|author-email|author_email|' setup.cfg
}

build() {
	cd "$builddir"
	python -m build --wheel --no-isolation
}

pkgver(){
	cd "$builddir"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
	cd "$builddir"
	pytest
}

package() {
	cd "$builddir"
	python -m installer --destdir="${pkgdir}" dist/*.whl
}
