#!/usr/bin/env -S sh -c 'nvchecker -cnvchecker.toml --logger=json | jq -r '\''.version | sub("^v"; "") | split("-") | .[-1]'\'' | xargs -i{} sed -i "s/^\\(pkgver=\\).*/\\1{}/" $0'
# shellcheck shell=bash disable=SC2034,SC2154
# ex: nowrap
_pkgname=doq
pkgname=python-${_pkgname}
pkgver=0.9.1
pkgrel=4
pkgdesc='Docstring generator'
arch=(any)
url=https://github.com/heavenshell/py-doq
license=(BSD)
depends=(python-parso python-jinja python-toml)
makedepends=(python-setuptools)
source=("$_pkgname-$pkgver::https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('baccc348ddf967c8bf32bfdf54da8326e1dc74f37865e2c176012ad0bc7eea1e')

package() {
	cd "$_pkgname-$pkgver" || exit 1

	python setup.py install --root="$pkgdir" --optimize=1
}
