# Maintainer:
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>

_module="diffusers"
_pkgname="python-$_module"
pkgname="$_pkgname${_pkgtype:-}"
pkgver=0.26.3
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
sha256sums=('514eeaf7587e1788b7e880b4332ca3ca6927c7fc7108ff6fcd5c887116fe2194')

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
