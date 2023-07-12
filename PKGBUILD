# Maintainer: schuay <jakob.gruber@gmail.com>
# Contributor: Ray Powell <ray_al@xphoniexx.net>

pkgname=mcomix
# Might want to move to date-based versions.
pkgver=2.2.0
pkgrel=1
pkgdesc="A user-friendly, customizable image viewer specifically designed to handle comic books"
arch=('any')
url="https://sourceforge.net/p/mcomix/wiki/Home/"
license=('GPL')
depends=('gtk3' 'python-cairo' 'python-gobject' 'python-pillow')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=(
  'lhasa: for lha compressed comics'
  'libunrar: for rar compressed comics'
  'p7zip: for 7z compressed comics'
  'python-pymupdf: for PDF comics'
  'unrar: for rar compressed comics'
  'unzip: for zip compressed comics'
)
source=(
  "https://downloads.sourceforge.net/project/${pkgname}/MComix-${pkgver}/${pkgname}-${pkgver}.tar.gz"
)
sha256sums=('514843e27c0e3b05f1ac11169eab3613a2c295158f09054d817adf58affb9ba3')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
