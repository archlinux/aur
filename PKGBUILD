# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=argos-translate
_name=argostranslate
pkgver=1.9.1
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
_commit=4bf4aeae2985b56610774b6e299766218bdc526b  # 1.9.1
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        "https://raw.githubusercontent.com/argosopentech/argos-translate/$_commit/requirements.txt")
sha256sums=('3a556b45f0616c9a4816359d2d0b27ef312d7913fa51f908a464f863ddf740a9'
            '0839b24f6ab5e3a6e972b4be36e9513d311b14d2ec4b26a7052a5f61f0a40c24')

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
