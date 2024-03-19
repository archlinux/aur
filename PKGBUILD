# Maintainer:
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>

_module="diffusers"
_pkgname="python-$_module"
pkgname="$_pkgname"
pkgver=0.27.1
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
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/archive/refs/tags/v$pkgver.$_pkgext")
sha256sums=('4b45b3d65b10a6206158f52246092876781628295a81d2117d2a1ee1681e5d55')

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
