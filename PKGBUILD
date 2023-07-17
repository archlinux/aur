#!/usr/bin/env -S sh -c 'nvchecker -cnvchecker.toml --logger=json | jq -r '\''.version | sub("^v"; "") | split("-") | .[-1]'\'' | xargs -i{} sed -i "s/^\\(pkgver=\\).*/\\1{}/" $0'
# shellcheck shell=bash disable=SC2034,SC2154
# ex: nowrap
pkgname=portage
pkgver=3.0.49
pkgrel=1
pkgdesc="package management and distribution system for Gentoo"
arch=(any)
url=https://wiki.gentoo.org/wiki/Project:Portage
depends=(python)
makedepends=(python-installer)
license=(GPL2)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${pkgname::1}/$pkgname/${pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('49f8d02ff388ab3af82c977dfc52db2a7fcbd37ecec466d6dc63f83f33e727a7')

package() {
	cd "$srcdir" || return 1
	python -m installer --destdir="$pkgdir" ./*.whl
}
