# Maintainer: shieldwed <shieldwed [at] outlook [dot] com>

pkgbase=python-pyvcloud
_pkgname=pyvcloud
# pkgname=(python-pyvcloud python2-pyvcloud) currently only python2 compatible
pkgname=(python2-pyvcloud)
pkgver=16
pkgrel=1
pkgdesc="VMware vCloud Python SDK"
arch=('any')
url="https://pypi.python.org/pypi/pyvcloud/"
license=('Apache')
makedepends=(
  # 'python-setuptools' currently only python2 compatible
  'python2-setuptools'
)
source=("https://github.com/vmware/pyvcloud/archive/$pkgver.tar.gz")
sha256sums=('962b4b3808fa032508544508210d6e0e5b985ae4935ec63ae93313f3c5be07ca')

prepare() {
    test -d "$srcdir"/$_pkgname-py2-$pkgver || mkdir "$srcdir"/$_pkgname-py2-$pkgver
    cp -a "$srcdir"/$_pkgname{-$pkgver/.,-py2-$pkgver/}

    find $_pkgname-$pkgver/pyvcloud -name \*.py -exec \
      sed -i "s:^#!.*bin.*python$:#!/usr/bin/env python3:" {} +
    find $_pkgname-py2-$pkgver/pyvcloud -name \*.py -exec \
      sed -i "s:^#!.*bin.*python$:#!/usr/bin/env python2:" {} +
}

package_python-pyvcloud() {
  depends=(
    'python'
    'python-iptools'
    'python-lxml'
    'python-netaddr'
    'python-requests'
    'python-progressbar'
     )
  cd "$srcdir/$_pkgname-$pkgver"
  python3 setup.py install "--root=$pkgdir" --optimize=1
}

package_python2-pyvcloud() {
  depends=(
    'python2'
    'python2-iptools'
    'python2-lxml'
    'python2-netaddr'
    'python2-requests'
    'python2-progressbar'
    )
  cd "$srcdir/$_pkgname-py2-$pkgver"
  python2 setup.py install "--root=$pkgdir" --optimize=1
}
