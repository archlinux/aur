# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=argos-translate
_name=argostranslate
pkgver=1.9.2
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
_commit=ba128508f5cf973c2dffd8280b1276e19a400cf8  # 1.9.2
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        "https://raw.githubusercontent.com/argosopentech/argos-translate/$_commit/requirements.txt")
sha256sums=('9742daeca1b1c6aa093f6ed8b3533f850f58e28b4b75e8bba8eacaa3b5862771'
            '93e0c4f7db7f69df00f8c87b30ad2499c4028f130835411811dff2f2cca4601e')

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
