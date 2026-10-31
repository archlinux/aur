# Maintainer: Dmitriy Geels <dmitriy dot geels at gmail dot com>
pkgname=python-turbohtml
pkgver=1.15.4
pkgrel=1
pkgdesc='A fast, fully typed HTML toolkit for Python, powered by a C-accelerated core.'
arch=(x86_64 aarch64)
url="https://github.com/tox-dev/turbohtml"
license=('MIT AND Apache-2.0 AND BSD-3-Clause')
depends=(python glibc)
makedepends=(python-build python-installer python-wheel 'meson>=1.12.1' 'meson-python>=0.22.1' 'ninja>=1.13.2' 'patchelf>=0.11' meson meson-python ninja patchelf)
_ref=1.15.4
_builddir=turbohtml-1.15.4
source=("turbohtml-1.15.4.tar.gz::https://github.com/tox-dev/turbohtml/archive/refs/tags/$_ref.tar.gz")
sha256sums=('ab59990b7ad453d2c75bf707d5f0111e8652d71ac4f476bdc40fb970243ed681')

prepare(){
 cd "$srcdir/$_builddir"
 # GitHub archives have no Git metadata; freeze the release version.
 python tools/generate_version.py --version "$pkgver" --write src/turbohtml/_version.py
}

build(){
 cd "$srcdir/$_builddir"
 python -m build --wheel --no-isolation
}

package(){
 cd "$srcdir/$_builddir"
 python -m installer --destdir="$pkgdir" dist/*.whl
 install -Dm644 "$srcdir/turbohtml-1.15.4/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
 install -Dm644 licenses/LICENSE-* -t "$pkgdir/usr/share/licenses/$pkgname/"
}
