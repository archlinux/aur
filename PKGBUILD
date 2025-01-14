# Maintainer: konez2k@aur
# Contributor: bruceutut@aur
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>
# Contributor: Ryan Coyner <rcoyner@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgbase=pyglet
pkgname=('python-pyglet')
pkgver=2.1.0
pkgrel=1
pkgdesc="A cross-platform windowing and multimedia library for Python"
arch=('any')
url="https://github.com/pyglet/pyglet"
license=('BSD')
depends=('python' 'glu')
makedepends=('python-build' 'python-flit-core' 'python-installer')
optdepends=('ffmpeg: provides audio&video support'
    'openal: live audio')
source=("$pkgbase-$pkgver.zip::https://github.com/pyglet/pyglet/archive/refs/tags/v$pkgver.zip")
sha256sums=('0e7c4772b18c35f9ea98162ae399da0034b5fb241eea67f2ea7b2d0e18725f3a')

prepare() {
    cd "$srcdir/$pkgbase-$pkgver"
}

build() {
    cd "$srcdir/$pkgbase-$pkgver"
    python -m build --wheel --no-isolation
}

package_python-pyglet() {
    depends=('python' 'glu')
    cd "$srcdir/$pkgbase-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
