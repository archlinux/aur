# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# https://aur.archlinux.org/packages/updaurpkg-git
# $ updaurpkg --apply
_repo=InterDigitalInc/CompressAI
_source_type=github-tags
_upstreamver='v1.2.1'
_pkgname=$(tr A-Z a-z <<< ${_repo##*/})

pkgname=python-$_pkgname
pkgver=${_upstreamver##v}
pkgrel=1
pkgdesc="A PyTorch library and evaluation platform for end-to-end compression research"
arch=(x86_64)
url=https://github.com/$_repo
depends=(python-numpy python-scipy python-matplotlib python-torchvision python-pytorch-msssim)
makedepends=(python-setuptools)
license=(BSD)
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/${_pkgname//-/_}-$pkgver.tar.gz")
sha256sums=('84e48808c1da33f330fc52a9cae269f2ec6822368c0dd622798278855b16479c')

package() {
  cd "$srcdir/$_pkgname-$pkgver" || return 1
  python setup.py install --root="$pkgdir" --optimize=1 || return 1
}
