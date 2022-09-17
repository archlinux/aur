# Maintainer: Timo Wilken <timo.21.wilken+aur@gmail.com>
pkgname=alibuild
pkgver=1.12.0
pkgrel=1
pkgdesc='A simple build tool for ALICE software at CERN'
arch=(i686 x86_64)
url='https://alisw.github.io/alibuild/'
license=(GPL3)
# coreutils: ln mkdir df uname env
# util-linux: mount
# In theory, gzip is optional if we have pigz, but that's complicated for a PKGBUILD.
depends=(coreutils util-linux bash tar gzip git python python-requests python-yaml python-distro)
optdepends=('pigz: alternative, faster gzip implementation'
            'rsync: support for rsync:// remote stores'
            'docker: for building inside Docker containers'
            's3cmd: support for s3:// remote stores'
            'curl: support for s3:// remote stores'
            'findutils: support for s3:// remote stores'
            'awk: support for s3:// remote stores'
            'python-boto3: support for b3:// remote stores')
source=("https://github.com/alisw/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('36028c2157d597525f5f9fc0edddaa48ea740caef6b9598f7a0d8775f21b8cd1')

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
