# Maintainer: éclairevoyant

_pkgname=pympv
pkgname="python-$_pkgname"
pkgver=0.7.1
pkgrel=2
pkgdesc='Python wrapper for libmpv'
arch=(x86_64)
url="https://github.com/marcan/$_pkgname"
license=(GPL3)
depends=(mpv python)
makedepends=(cython python-setuptools)
conflicts=(python-mpv)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        0003-Give-str-its-Python-3-meaning.patch
        0008-Update-to-libmpv-API-2.0.patch)
b2sums=('57f9f0dbbf8d14714729642f0a646c0e9227134057b30c73c377c598c4c0b6e56147ec5a6ccc980e8b223775edd31072c2842f3d249a3698db5e83bbdc3f05ef'
        'd402ed389528472b4cbbae7bc78f95b67c7c3c353f08be2aded42ef209e66e612dea34896e0c435a02ba6e8b490a3d66ad2753be52bfa58f6fbbe8215c47e432'
        'fc1937d569a620820f80bdd308b5c3eabf31a7ca33250138b0f855be9787a46166e43085728300f12ac2f62fe31c77ab1207a3652860c1997af31f97101b3c9a')

prepare() {
	cd $_pkgname-$pkgver
	patch -Np1 -i ../0003-Give-str-its-Python-3-meaning.patch
	patch -Np1 -i ../0008-Update-to-libmpv-API-2.0.patch
}

build() {
	cd $_pkgname-$pkgver
	python setup.py build
}

package() {
	cd $_pkgname-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
