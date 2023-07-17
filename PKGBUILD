#!/usr/bin/env -S sh -c 'nvchecker -cnvchecker.toml --logger=json | jq -r '\''.version | sub("^v"; "") | split("-") | .[-1]'\'' | xargs -i{} sed -i "s/^\\(pkgver=\\).*/\\1{}/" $0'
# shellcheck shell=bash disable=SC2034,SC2154
# ex: nowrap
_pkgname=argopt
pkgname=python-$_pkgname
pkgver=0.8.2
pkgrel=1
pkgdesc="doc to argparse driven by docopt"
arch=(any)
url=https://github.com/casperdcl/argopt
makedepends=(python-installer)
license=(MPL)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${_pkgname:0:1}/$_pkgname/${_pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('c613eac7f0712760340f0b67cd5ef4b7537319f92ad5ce48a83c9132d249f8a1')

package() {
  cd "$srcdir" || return 1
  python -m installer --destdir="$pkgdir" ./*.whl
}
