# Maintainer: envolution
# Contributor: David Runge <dvzrv@archlinux.org>
# shellcheck shell=bash disable=SC2034,SC2154

_name=IPy
pkgname=python-ipy
pkgver=1.01
pkgrel=5
pkgdesc="Class and tools for handling of IPv4 and IPv6 addresses and networks"
arch=('any')
url="https://github.com/autocracy/python-ipy"
license=('BSD-3-Clause')
depends=('python')
makedepends=(python-setuptools python-installer python-wheel python-build)
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('f0983254523025a1819d543877d9651fb6a9e39dabd3b043488495f681b02e43b544a0121658a0430a418a1c39b360a59db1699af87a75a16a2bdc29fcb2b74c')
b2sums=('10d5ac5c3df00a562393ee762e9ad0f458ecf4745f894ab23e686b7112842adcbb3f25064c0010630745273fa72280ba5ef92a951d687d0f46f341acd6c041ad')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  pytest -v
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir=${pkgdir} dist/*.whl
  install -vDm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -vDm 644 {AUTHORS,ChangeLog,README.rst} -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim:set ts=2 sw=2 et:
