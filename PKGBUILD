#!/usr/bin/env -S sh -c 'nvchecker -cnvchecker.toml --logger=json | jq -r '\''.version | sub("^v"; "") | split("-") | .[-1]'\'' | xargs -i{} sed -i "s/^\\(pkgver=\\).*/\\1{}/" $0'
# shellcheck shell=bash disable=SC2034,SC2154
# ex: nowrap
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
_pkgname=tree-sitter-requirements
pkgname=python-$_pkgname
pkgver=0.1.4
pkgrel=1
pkgdesc="A tree-sitter parser for requirements.txt files"
arch=(x86_64)
url=https://github.com/Freed-Wu/$_pkgname
depends=(python)
makedepends=(python-installer)
license=(GPL3)
_py=cp37
source=("https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/${_pkgname//-/_}/${_pkgname//-/_}-$pkgver-$_py-abi3-manylinux_2_5_x86_64.manylinux1_x86_64.manylinux_2_17_x86_64.manylinux2014_x86_64.whl")
sha256sums=('6c2ed84d8b5d436667513ca16653da3f7bf8ae579918c5b8d196aa3de3ab4dab')

package() {
	python -minstaller -d"$pkgdir" ./*.whl
}
