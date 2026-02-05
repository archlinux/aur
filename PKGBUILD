# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-spimdisasm
pkgver=1.39.3
pkgrel=1
pkgdesc='A matching MIPS disassembler API and front-ends with built-in instruction analysis'
arch=(any)
url='https://github.com/Decompollaborate/spimdisasm'
license=(MIT)
depends=(
  python
  python-rabbitizer
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
source=(
  "$pkgname::git+$url#tag=$pkgver"
  remove-twine.patch
)
sha512sums=('dd69d6389215c7a92b240b9947a739dc1ea44307ee782374eb3146782f1c91fd4cfe72d121d7da35b640dad1f334d1ba0923771e2a5515c2506894e8aa976ba9'
            'f6d0090433d7c91d857086eb8298ced06d1754e9fd4834e512f0d15f9f2ebe7a1f7414fa591adde8b89c08358e35fd057a592c448e2e728f4285f1a29523e388')
b2sums=('fd111a7655593e2654aeb6679f6f18f3d81343a38fe416aee9f32c83b92aea69656062d8ec1af2a1f36bb6ae29bbcc3589739a016dbd47e509dc8922dacdbc7b'
        '81f8f913b9d489d037352760d1e625d6f43813ab76253ec583cbbe54f85907d9c879871ab9a81dae1b741d551ae8f7560443d89766116c43e6b1c54b60f4d7e2')

prepare() {
  cd "$pkgname"

  # remove unnecessary dependency on twine
  patch -p1 -i "$srcdir/remove-twine.patch"
}

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
