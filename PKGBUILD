# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: xRemaLx <anton.komolov@gmail.com>

pkgname=python-klein
# https://github.com/twisted/klein/blob/trunk/NEWS.rst
pkgver=24.8.0
pkgrel=3
arch=(any)
pkgdesc='A web micro-framework built on werkzeug and twisted.web'
url='https://github.com/twisted/klein'
license=(MIT)
depends=(python python-attrs python-hyperlink python-incremental
         python-tubes python-twisted python-werkzeug python-zope-interface
         # Detected by namcap and not declared in setup.py
         python-constantly)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-hypothesis python-treq python-pytest)
source=("https://github.com/twisted/klein/archive/$pkgver/klein-$pkgver.tar.gz")
sha512sums=('ef7ac0b268f3e10b5e4279014282a27fece4423d9fff1ee9ef6aa3aff0ad6a2f7d72b02951ac609a99b29c8f0b8fb98991b92a8e8bb8bd104eb8519d809fc398')

build() {
  cd klein-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd klein-$pkgver
  pytest src/klein/test
}

package() {
  cd klein-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
