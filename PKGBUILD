# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-cmudict
pkgver=1.0.33
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
sha256sums=('e75f66c27953b202d907f45cb9d0ac22d968b8fb0fe7ed97454acb77a920d45f'
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
