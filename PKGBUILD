# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=argos-translate
_name=argostranslate
pkgver=1.10.0
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
_commit=561369af792133585b4284785eb92e9baf1d632e  # 1.10.0
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        "requirements-$pkgver.txt::https://raw.githubusercontent.com/argosopentech/argos-translate/$_commit/requirements.txt")
sha256sums=('237f0bdaef5a45aade034ac712c1d0c18fd42887fc08141808dcadde7bfd1f67'
            'fa90353d2e569f883a33085143d4a94508a717ed0e66916495d2946ef0e7c0e5')

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

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
