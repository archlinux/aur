#!/usr/bin/env -S sh -c 'nvchecker -cnvchecker.toml --logger=json | jq -r '\''.version | sub("^v"; "") | split("-") | .[-1]'\'' | xargs -i{} sed -i "s/^\\(pkgver=\\).*/\\1{}/" $0'
# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu, Zhenyu <wuzhenyu@ustc.edu>
# Update this package by:
#
# ```sh
# sudo pacman -S nvchecker jq pacman-contrib
# ./PKGBUILD
# ```
_pkgname=torchac
pkgname=python-$_pkgname
pkgver=0.9.3
pkgrel=1
pkgdesc="fast arithmetic coding for pytorch"
arch=(any)
url=https://github.com/fab-jul/$_pkgname
depends=(python-pytorch)
makedepends=(python-installer)
license=(GPL3)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/${_pkgname//-/_}/${_pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('ab4eedbe230c677ff076e07142ce611c6a76185723c0f41bd014e6893678f5c9')

package() {
	python -minstaller -d"$pkgdir" ./*.whl
}
# ex: nowrap
