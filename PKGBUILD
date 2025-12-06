#!/usr/bin/env -S sh -c 'nvchecker -cnvchecker.toml --logger=json | jq -r '\''.version | sub("^v"; "") | split("-") | .[-1]'\'' | xargs -i{} sed -i "s/^\\(pkgver=\\).*/\\1{}/" $0'
# shellcheck shell=bash disable=SC2034,SC2154
# ex: nowrap
pkgname=portage
pkgver=3.0.72
pkgrel=1
pkgdesc="package management and distribution system for Gentoo"
arch=(any)
url=https://wiki.gentoo.org/wiki/Project:Portage
depends=(python)
makedepends=(python-installer)
license=(GPL2)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${pkgname::1}/$pkgname/${pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('6aeb08f19cdbb97d7b504251cb20e43917029b4e1ca1e91741cadd38a297e45a')

package() {
	cd "$srcdir" || return 1
	python -m installer --destdir="$pkgdir" ./*.whl
}
