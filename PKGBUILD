# Maintainer: Clemmitt Sigler <cmsigler.online@gmail.com>
# Contributor: konez2k@aur
# Contributor: bruceutut@aur
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>
# Contributor: Ryan Coyner <rcoyner@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=('python-pyglet1')
_pkgsrcname=pyglet
pkgver=1.5.30
pkgrel=2
pkgdesc="A cross-platform windowing and multimedia library for Python -- Version 1"
arch=('any')
url="https://github.com/pyglet/pyglet"
license=('BSD-3-Clause')
depends=('python' 'glu')
makedepends=('python-build' 'python-flit-core' 'python-installer' 'python-gobject' 'python-pillow' 'python-setuptools' 'gstreamer')
optdepends=('ffmpeg: provides audio&video support'
    'openal: live audio')
conflicts=('python-pyglet' 'python-pyglet-git')
provides=("python-pyglet=$pkgver")
source=("$_pkgsrcname-$pkgver.zip::https://github.com/pyglet/pyglet/archive/refs/tags/v$pkgver.zip")
sha256sums=('14dc58ce38343a8cd950dbaab7628e7736b0692d7b15dd2f25e35af1d6f08f88')

prepare() {
    cd "$srcdir/$_pkgsrcname-$pkgver"
}

build() {
    cd "$srcdir/$_pkgsrcname-$pkgver"
    python -m build --wheel --no-isolation
}

package_python-pyglet1() {
    depends=('python' 'glu')
    cd "$srcdir/$_pkgsrcname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
