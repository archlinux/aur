# Maintainer: Philipp A. <flying-sheep@web.de>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=python-soundcard-git
pkgver=0.4.2.r7.g213aa0a
pkgrel=1
pkgdesc='Play and record audio without resorting to CPython extensions'
arch=(any)
url='https://github.com/bastibe/SoundCard'
license=('BSD3')
depends=(python python-numpy python-cffi)
provides=("python-soundcard=$pkgver")
conflicts=(python-soundcard)
makedepends=(python-setuptools python-build python-installer python-wheel)
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
	cd "$srcdir/SoundCard"
	# 0.3.3 is mistagged
	git tag -f 0.3.3 3d14b335513290cf8197f54e6c8ca4f353aaa535 >/dev/null
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/SoundCard"
	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/SoundCard"
	python -m installer --destdir="$pkgdir" dist/*.whl
}

