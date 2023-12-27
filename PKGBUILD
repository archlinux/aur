# Maintainer:
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>

_module="diffusers"
_pkgname="python-$_module"
pkgname="$_pkgname${_pkgtype:-}"
pkgver=0.25.0
pkgrel=1
pkgdesc='Pretrained diffusion models for image and audio generation in PyTorch'
url='https://github.com/huggingface/diffusers'
license=('Apache-2.0')
arch=('any')

makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)

_pkgsrc="$_module-$pkgver"
source=("$_module-$pkgver"::"$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('02a791c998eaa0510b6e588a48bb4a35916465c956ae277d27d62724b8efdea0')

build() {
  cd "$_pkgsrc"
  python -m build --no-isolation --wheel
}

package() {
  depends+=(
    'python-beautifulsoup4'
    'python-importlib-metadata'
    'python-msgpack'
    'python-numpy'
    'python-pillow'
    'python-pytorch'
    'python-requests'
    'python-scipy'
    'python-tqdm'

    # AUR
    'python-huggingface-hub'
  )

  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
