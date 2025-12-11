#!/usr/bin/env -S sh -c 'nvchecker -cnvchecker.toml --logger=json | jq -r '\''.version | sub("^v"; "") | split("-") | .[-1]'\'' | xargs -i{} sed -i "s/^\\(pkgver=\\).*/\\1{}/" $0'
# shellcheck shell=bash disable=SC2034,SC2154
# ex: nowrap
_pkgname=compressai
pkgname=python-$_pkgname
pkgver=1.2.8
pkgrel=1
pkgdesc="A PyTorch library and evaluation platform for end-to-end compression research"
arch=(x86_64)
url=https://github.com/InterDigitalInc/CompressAI
depends=(python-einops python-matplotlib python-numpy python-pandas python-pytorch-msssim python-scipy python-torch-geometric python-torchvision python-tqdm)
makedepends=(python-setuptools pybind11)
license=(BSD-3-Clause)
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/${_pkgname//-/_}-$pkgver.tar.gz")
sha256sums=('d90a923694b4b66c3e39bd90316e7f177a620787190ca7550731fc16c1bc7d5e')

package() {
  cd "$_pkgname-$pkgver" || return 1
  python setup.py install --root="$pkgdir" --optimize=1
}
