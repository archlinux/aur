# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <chris@chrisarndt.de>

pkgname=sfzlint
pkgver=0.1.5
pkgrel=6
pkgdesc='A linter and parser for SFZ files'
arch=(any)
url='https://github.com/jisaacstone/sfzlint'
license=(MIT)
depends=(python-appdirs python-lark-parser python-yaml)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
groups=(pro-audio)
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jisaacstone/sfzlint/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f5cdc108fa6965101b1865de836468c8e4c54270af643b96dc0c377130b6ee7b')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname-$pkgver
  pytest -v tests
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 README.md TODO.txt -t "$pkgdir"/usr/share/doc/$pkgname
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
