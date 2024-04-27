#!/usr/bin/env -S sh -c 'nvchecker -cnvchecker.toml --logger=json | jq -r '\''.version | sub("^v"; "") | split("-") | .[-1]'\'' | xargs -i{} sed -i "s/^\\(pkgver=\\).*/\\1{}/" $0 && updpkgsums && makepkg --printsrcinfo > .SRCINFO'
# shellcheck shell=bash disable=SC2034,SC2154
# Update this package by:
#
# ```sh
# sudo pacman -S nvchecker jq pacman-contrib
# ./PKGBUILD
# ```
_pkgname=latexify_py
pkgname=python-${_pkgname//_/-}
pkgver=0.4.3.post1
pkgrel=1
pkgdesc="A library to generate LaTeX expression from Python code."
arch=(any)
url=https://github.com/google/latexify_py
depends=(python-dill)
makedepends=(python-installer)
license=(Apache-2.0)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${_pkgname:0:1}/$_pkgname/${_pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('36b493358a90d80b6abb89eb7560eeff89ca5ea29db2187f7327851cfc96192a')

package() {
	cd "$srcdir" || return 1
	python -m installer --destdir="$pkgdir" ./*.whl
}
# ex: nowrap
