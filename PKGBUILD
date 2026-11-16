# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

# Installs the wheel the ghidra package ships, so that the stubs always match the Ghidra they
# describe: a new Ghidra release fails to build here until pkgver and the depends on ghidra follow
# it.
pkgname=python-ghidra-stubs
_name=${pkgname#python-}
pkgver=12.2
pkgrel=1
pkgdesc="PEP 561 type stubs of the Ghidra API, from the ghidra package"
arch=(any)
url="https://github.com/NationalSecurityAgency/ghidra"
license=(Apache-2.0)
depends=(python
  'ghidra>=12.2'
  'ghidra<12.3')
makedepends=(
  'ghidra>=12.2'
  'ghidra<12.3'
  python-installer)
optdepends=('python-pyghidra: to use the Ghidra API from Python')
# The AUR's stubs of ghidra-pyi-generator install the same modules
conflicts=(python-ghidra-stubs-bin)

package() {
  python -m installer --destdir="$pkgdir" \
    "/opt/ghidra/docs/ghidra_stubs/${_name//-/_}-$pkgver-py3-none-any.whl"
}
