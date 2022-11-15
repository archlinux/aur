# Maintainer: schuay <jakob.gruber@gmail.com>
# Contributor: Ray Powell <ray_al@xphoniexx.net>

pkgname=mcomix
# Might want to move to date-based versions.
pkgver=2.0.2
pkgrel=2
pkgdesc="A user-friendly, customizable image viewer specifically designed to handle comic books"
arch=('any')
url="https://sourceforge.net/p/mcomix/wiki/Home/"
license=('GPL')
depends=('gtk3' 'python-cairo' 'python-gobject' 'python-pillow')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=('libunrar: for rar compressed comics'
            'p7zip: for 7z compressed comics'
            'unrar: for rar compressed comics'
            'unzip: for zip compressed comics'
            'lhasa: for lha compressed comics'
            'mupdf-tools: for PDF comics')
source=("https://downloads.sourceforge.net/project/${pkgname}/MComix-${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('ef38d0713e56a07c72f98cc20c9eacda780e39f3b82fd7b1baa06a69c79c0a58')

build(){
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
