# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-cmudict
pkgver=1.0.32
pkgrel=1
pkgdesc="A versioned python wrapper package for cmudict"
arch=('any')
url="https://github.com/prosegrinder/python-cmudict"
license=('GPL-3.0-only')
depends=('python')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-poetry-core'
  'python-wheel'
)
source=("git+https://github.com/prosegrinder/python-cmudict.git#tag=v$pkgver"
        'git+https://github.com/cmusphinx/cmudict.git')
sha256sums=('c5d5fdbbdedbc44961f59d2269fb842f817f9acfed1e4f616a81a6e7723e87c8'
            'SKIP')

prepare() {
  cd "$pkgname"
  git submodule init
  git config submodule.src/cmudict/data.url "$srcdir/cmudict"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "$pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
