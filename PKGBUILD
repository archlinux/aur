# Maintainer: Walter - "bWVAd2FsdGVyY2FzYW5vdmEueHljCg==" - base64

pkgname='pynetdicom-git'
_pkgname='pynetdicom'
pkgver=v1.5.0.r111.g9e8a86d70
pkgrel=1
pkgdesc="A Python implementation of the DICOM networking protocol"
arch=('i686' 'x86_64')
url="https://github.com/pydicom/pynetdicom"
license=('GPL3')
depends=('python-pydicom' 'python')
makedepends=('python-setuptools' 'git')
provides=('pynetdicom')
conflicts=('pynetdicom')
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm 644 LICENCE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
