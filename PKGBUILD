#!/usr/bin/env -S sh -c 'nvchecker -cnvchecker.toml --logger=json | jq -r '\''.version | sub("^v"; "") | split("-") | .[-1]'\'' | xargs -i{} sed -i "s/^\\(pkgver=\\).*/\\1{}/" $0'
# shellcheck shell=bash disable=SC2034,SC2154
# ex: nowrap
_pkgname=compressai
pkgname=python-$_pkgname
pkgver=1.2.4
pkgrel=1
pkgdesc="A PyTorch library and evaluation platform for end-to-end compression research"
arch=(x86_64)
url=https://github.com/InterDigitalInc/CompressAI
depends=(python-numpy python-scipy python-matplotlib python-torchvision python-pytorch-msssim)
makedepends=(python-setuptools)
license=(BSD)
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/${_pkgname//-/_}-$pkgver.tar.gz")
sha256sums=('7cbfbd11259ad52c3d8c77edad52778567e76a36b4c91e6d9c18f4fbe1d9cead')

package() {
  cd "$_pkgname-$pkgver" || return 1
  python setup.py install --root="$pkgdir" --optimize=1
}
