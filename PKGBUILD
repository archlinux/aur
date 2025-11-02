# Contributor: Danny Waser (Waser Technologies) <waser@waser.tech>

pkgname=python-pyworld
pkgver=0.3.5
pkgrel=1
pkgdesc='A wrapper for WORLD vocoder'
arch=(x86_64)
url=https://github.com/JeremyCCHsu/Python-Wrapper-for-World-Vocoder
license=(MIT)
depends=(glibc gcc-libs python python-{numpy,setuptools})
makedepends=(cython python-{build,wheel,installer})
optdepends=(python-{soundfile,matplotlib} )
_wcommit=8d79b88b7dd92e8a132996cf74080b2d6f881b98
source=("${pkgname}${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
https://github.com/mmorise/World/archive/${_wcommit}.tar.gz)
noextract=(${_wcommit}.tar.gz)
sha256sums=('88416f9eba9ebcd1303934c2b9c7f2a85173ee4e406ed065d1c0c13a4be70dfe'
            '84d6cfcae36907d378c1f2abb780330bca5869b4877b73050a4ca73b9f2df241')
prepare() {
  bsdtar -xf ${_wcommit}.tar.gz -C Python-Wrapper-for-World-Vocoder-$pkgver/lib/World --strip-components=1
}

build() {
  cd Python-Wrapper-for-World-Vocoder-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd Python-Wrapper-for-World-Vocoder-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
