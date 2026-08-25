# Maintainer: aaronliu0130@gmail.com «a̴a̴r̸o̵n̴l̷i̸u̴0̶1̷3̶0̶@̸g̵m̸a̶i̶l̴.̶c̸o̷m̸»

pkgname=xcompose-utils
pkgver=0.5.1
pkgrel=1
license=(MIT)
pkgdesc='Utilities to manage X11 compose sequences'
arch=(any)
provides=("xcfmt=${pkgver}")
depends=(python python-pygtrie)
url='https://github.com/Udzu/xcompose'
makedepends=(python-hatchling)
# download specific files to avoid the repo's archive of tons of compose mappings
source=("${url}/raw/refs/tags/v${pkgver}/"{pyproject.toml,src/xcompose/__init__.py,src/xcompose/keysymdef.h,LICENSE,README.md})
b2sums=('bdca24c00667f5c69fa25051dfd32ef89c2307fb4c753396fa04aaff0f06579d7b6b6d8f4358050537c86810fee6bc735f1ae70987a725676f11e6a4f6cdb146'
        'fed74fe43a49518da03e554f60c96a42698984411df9b8ee1361702ad32101df04d912c3278e1fc6135fbe3fe7530d69a96e378dcec15aa36bf6e9aa8635bc32'
        '4ffa16abb42ac1842d93ea69c61a9e3f733a322d92e6b487ffe46676b9f51e618d0245eabee3d056450270d454bb4d187bed9321f1883dd9e83cc09b9196a6f1'
        '86cccc0a240549d96b75df60145d63ee442915e2a92536523480921c9b4e6a18e6c5a76e7d40d90ebae6e84e4b611ab7b39950cba6bdc5fa3cedf7ba6a1ed4ee'
        '5270192ab75b49c956175e429f2ca62c651168e28f3642146654d12d5d49a9b820d3dd53cabaf62d2df9ff4da4e3a74e5c7e7e8e1f67f8fb1fa8a292532a3ac0')

prepare() {
	mkdir -p src/xcompose/
	mv __init__.py keysymdef.h src/xcompose/
}

build() {
  python -m build --wheel --no-isolation
}

package() {
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
