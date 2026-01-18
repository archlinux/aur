# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=shedskin
pkgver=0.9.11
pkgrel=1
pkgdesc='An experimental (restricted-)Python-to-C++ compiler'
arch=('any')
url='https://shedskin.github.io/'
license=('GPL-3.0-only')
depends=('pcre2' 'gc' 'python')
makedepends=('git' 'python-build' 'python-installer' 'python-poetry-core')
source=("git+https://github.com/shedskin/shedskin.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
  sed -i 's:bin/python:usr/bin/python:' "$pkgname/scripts/$pkgname"
}

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}
package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
