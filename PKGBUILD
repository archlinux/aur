#!/usr/bin/env -S sh -c 'nvchecker -cnvchecker.toml --logger=json | jq -r '\''.version | sub("^v"; "") | split("-") | .[-1]'\'' | xargs -i{} sed -i "s/^\\(pkgver=\\).*/\\1{}/" $0'
# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu, Zhenyu <wuzhenyu@ustc.edu>
# Update this package by:
#
# ```sh
# sudo pacman -S nvchecker jq pacman-contrib
# ./PKGBUILD
# ```
_pkgname=autopxd
pkgname=python-$_pkgname
pkgver=3.0.0
pkgrel=1
pkgdesc="automatically generate Cython pxd files from C headers"
arch=(any)
url=https://github.com/elijahr/$_pkgname
depends=(python-pycparser python-click)
makedepends=(uv python-installer)
license=(MIT)
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/${_pkgname}2/${_pkgname//-/_}2-$pkgver.tar.gz")
sha256sums=('0df28bcee563b44a545e241ecda771d816a07e05fc6bf306d9480160bb56674f')

build() {
	cd "${_pkgname//-/_}2-$pkgver" || return 1
	uv build --wheel -n
}

package() {
	cd "${_pkgname//-/_}2-$pkgver" || return 1
	python -m installer --prefix="$pkgdir/usr" dist/*.whl
}
# ex: nowrap
