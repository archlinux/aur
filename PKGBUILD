# Maintainer: Timo Wilken <timo.21.wilken+aur@gmail.com>
pkgname=alibuild
pkgver=1.8.6
pkgrel=3
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
sha256sums=('c63cd5655fafb9397ba112940b920d428e1a374379727a56ca8612c8a89e03c1')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i "s/LAST_TAG/$pkgver/g" setup.py
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
