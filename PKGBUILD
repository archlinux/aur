# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=argos-translate
_name=argostranslate
pkgver=1.9.3
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
_commit=c5645c3f5fe71470216380a40ff8c7ad11ec58a3  # 1.9.3
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        "https://raw.githubusercontent.com/argosopentech/argos-translate/$_commit/requirements.txt")
sha256sums=('3750e1f36dfc7032a920c7904fae39943bd831b3968d5a86b96c6ddfbf934264'
            'd065ab2c74402c94c6dee79025f750184eaf6f3b00bf68bb5caea59b837d37ae')

prepare() {
  cp -f requirements.txt "$_name-$pkgver"
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
