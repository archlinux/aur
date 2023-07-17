#!/usr/bin/env -S sh -c 'nvchecker -cnvchecker.toml --logger=json | jq -r '\''.version | sub("^v"; "") | split("-") | .[-1]'\'' | xargs -i{} sed -i "s/^\\(pkgver=\\).*/\\1{}/" $0'
# shellcheck shell=bash disable=SC2034,SC2154
# ex: nowrap
_pkgname=py-notifier
pkgname=python-$_pkgname
pkgver=0.5.0
pkgrel=1
pkgdesc="Cross-platform desktop push-notifications."
arch=(any)
url=https://github.com/YuriyLisovskiy/pynotifier
makedepends=(python-installer)
depends=(libnotify)
license=(MIT)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${_pkgname:0:1}/$_pkgname/${_pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('cb75a4ae1ed7839b5794dc94c0dd5b38e791c32f53041e99c64f71d9a1dfb8d3')

package() {
	cd "$srcdir" || return 1
	python -m installer --destdir="$pkgdir" ./*.whl
}
