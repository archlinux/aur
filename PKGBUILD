# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=argos-translate
_name=argostranslate
pkgver=1.9.6
pkgrel=1
pkgdesc="Open-source offline translation library written in Python"
arch=('any')
url="https://www.argosopentech.com"
license=('MIT')
depends=(
  'python-ctranslate2'
  'python-packaging'
  'python-sacremoses'
  'python-sentencepiece'
  'python-stanza'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
_commit=e32ef619c920e718bf54247132d1e425b5d96a08  # 1.9.6
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        "requirements-$pkgver.txt::https://raw.githubusercontent.com/argosopentech/argos-translate/$_commit/requirements.txt")
sha256sums=('dd8cc1327aa67132299f950e160dd20d314b8cf484f540f0d22f1f07c2d8876b'
            'c6296e56fc2d3e3ca433ff8c51e87a5a0d5cb6eb84f46f6addcd4c1dca238bc9')

prepare() {
  cp -f "requirements-$pkgver.txt" "$_name-$pkgver/requirements.txt"
}

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}/"
}
