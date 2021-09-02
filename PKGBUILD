# Maintainer: Timo Wilken <timo.21.wilken+aur@gmail.com>
pkgname=alibuild
pkgver=1.8.9
pkgrel=2
pkgdesc='A simple build tool for ALICE software at CERN'
arch=(i686 x86_64)
url='https://alisw.github.io/alibuild/'
license=(GPL3)
# coreutils: ln mkdir df uname env
# util-linux: mount
# In theory, gzip is optional if we have pigz, but that's complicated for a PKGBUILD.
depends=(coreutils util-linux bash tar gzip git python python-requests python-yaml python-distro)
optdepends=('pigz: alternative, faster gzip implementation'
            'rsync: support for rsync remote stores'
            'docker: for building inside Docker containers'
            's3cmd: support for remote stores on S3'
            'curl: support for remote stores on S3'
            'findutils: support for remote stores on S3'
            'awk: support for remote stores on S3')
source=("https://github.com/alisw/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('86b92c29a50ab0e5b19a80d1ffa2161ae8863c2b7b890ddb9495839a34761411')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i "s/LAST_TAG/$pkgver/g" alibuild_helpers/__init__.py
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m unittest discover tests
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
