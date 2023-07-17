#!/usr/bin/env -S sh -c 'nvchecker -cnvchecker.toml --logger=json | jq -r '\''.version | sub("^v"; "") | split("-") | .[-1]'\'' | xargs -i{} sed -i "s/^\\(pkgver=\\).*/\\1{}/" $0'
# shellcheck shell=bash disable=SC2034,SC2154
# ex: nowrap
_pkgname=latexify_py
pkgname=python-${_pkgname//_/-}
pkgver=0.2.0
pkgrel=1
pkgdesc="A library to generate LaTeX expression from Python code."
arch=(any)
url=https://github.com/google/latexify_py
depends=(python-dill)
makedepends=(python-installer)
license=(ApacheV2)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${_pkgname:0:1}/$_pkgname/${_pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('a661528e334e51d83e9bc552f54776f11862261a04de9cdbbd5b5667ccbca423')

package() {
	cd "$srcdir" || return 1
	python -m installer --destdir="$pkgdir" ./*.whl
}
