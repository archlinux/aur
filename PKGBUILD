# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Guidelines specific to Bazaar, Git, Mercurial and Subversion packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Alex Kneipp <aur.usable613@passmail.net>
pkgname=fchart3
pkgver=0.12.0
pkgrel=1
pkgdesc="A Python project for creating high-quality astronomical finder charts and maps"
arch=(any)
url="https://github.com/skybber/fchart3"
license=('GPL-2.0-or-later')
groups=()
depends=(python python-numpy python-skyfield python-pillow python-skia python-cairo python-astroquery)
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname}")
conflicts=("${pkgname}")
replaces=()
backup=()
options=()
install=
source=("fchart3::git+https://github.com/skybber/fchart3.git#tag=RELEASE-${pkgver}")
noextract=()
sha256sums=('cbd0960ce71e54643af01bacf655c429589386f737f896d9110f87419803b5dc')


prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
	#patch -p1 -i "$srcdir/${pkgname%-VCS}.patch"
}

build() {
	cd "$srcdir/${pkgname}"
    python -m build --wheel --no-isolation
}

check() {
	cd "$srcdir/${pkgname}"
	#make -k check
}

package() {
	cd "$srcdir/${pkgname}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
