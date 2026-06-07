# SPDX-FileCopyrightText: Arch Linux contributors
# SPDX-License-Identifier: 0BSD
# Maintainer: Alex Kneipp <aur.usable613@passmail.net>

pkgname=fchart3-git
pkgver=0.12.0.r31.99fd498
pkgrel=2
pkgdesc="A Python project for creating high-quality astronomical finder charts and maps"
arch=(any)
url="https://github.com/skybber/fchart3"
license=('GPL-2.0-or-later')
groups=()
depends=(python python-numpy python-skyfield python-pillow python-skia python-cairo python-astroquery)
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('fchart3::git+https://github.com/skybber/fchart3.git')
noextract=()
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long --tags --abbrev=7 | sed 's/RELEASE-//g' |sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
    git -C "${srcdir}/${pkgname%-git}" clean -dfx
	#patch -p1 -i "$srcdir/${pkgname%-VCS}.patch"
}

build() {
	cd "$srcdir/${pkgname%-git}"
    python -m build --wheel --no-isolation
}

check() {
	cd "$srcdir/${pkgname%-git}"
	#make -k check
}

package() {
	cd "$srcdir/${pkgname%-git}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
