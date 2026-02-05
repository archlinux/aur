# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-splat64
pkgver=0.37.2
pkgrel=1
pkgdesc='A binary splitting tool to assist with decompilation and modding projects'
arch=(any)
url='https://github.com/ethteck/splat'
license=(MIT)
depends=(
  python
  python-pyyaml
  python-pylibyaml
  python-tqdm
  python-intervaltree
  python-colorama
)
makedepends=(
  git
  python-build
  python-installer
  python-hatchling
)
optdepends=(
  'python-spimdisasm: MIPS support'
  'python-rabbitizer: MIPS support'
  'python-pygfxd: MIPS support'
  'python-n64img: MIPS support'
  'python-crunch64: MIPS support'
)
conflicts=(splat)
source=("$pkgname::git+$url#tag=$pkgver")
sha512sums=('3d0f1e9f4fc98b490a55e5eff793e1556f986382bd51a83a36ffb095626503910a431b91dc9f7ecbe75fd69e825ec3eca66594048778926b21fb8d9f3e9d269c')
b2sums=('b52ccd917a47e1d4ac1d41ed18fd84d94502c4433d5f21db554b6805602b2935af2f8e68d02ca4b3fb271d3313fc94286c4c53ed817438e032c26d691c38d5d8')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname"  LICENSE
}
