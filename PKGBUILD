# SPDX-FileCopyrightText: Arch Linux contributors
# SPDX-License-Identifier: 0BSD
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
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
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
}

build() {
	cd "$srcdir/${pkgname}"
    python -m build --wheel --no-isolation
}

check() {
	cd "$srcdir/${pkgname}"
}

package() {
	cd "$srcdir/${pkgname}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
