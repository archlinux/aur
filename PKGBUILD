#!/usr/bin/env -S sh -c 'nvchecker -cnvchecker.toml --logger=json | jq -r '\''.version | sub("^v"; "") | split("-") | .[-1]'\'' | xargs -i{} sed -i "s/^\\(pkgver=\\).*/\\1{}/" $0'
# shellcheck shell=bash disable=SC2034,SC2154
# ex: nowrap
_pkgname=gscholar
pkgname=python-$_pkgname
pkgver=2.1.0
pkgrel=1
pkgdesc="Query Google Scholar with Python"
arch=(any)
url=https://github.com/venthur/gscholar
makedepends=(python-installer)
license=(MIT)
source=("$_pkgname::https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/${_pkgname//-/_}-$pkgver.tar.gz")
sha256sums=('f11d0462269fbec501849809c3f2574761a9a9e47dcbb5dc271e93242aa8387a')

package() {
	cd "$_pkgname-$pkgver"

	python setup.py install --root="$pkgdir" --optimize=1 || return 1
	install -D -m644 README.md $pkgdir/usr/share/doc/$_pkgname/README.md
}
