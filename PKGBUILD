# Maintainer: schuay <jakob.gruber@gmail.com>
# Contributor: Ray Powell <ray_al@xphoniexx.net>

pkgname=mcomix
# Might want to move to date-based versions.
pkgver=2.0.1
pkgrel=2
pkgdesc="A user-friendly, customizable image viewer specifically designed to handle comic books"
arch=('any')
url="https://sourceforge.net/p/mcomix/wiki/Home/"
license=('GPL')
depends=('gtk3' 'python-cairo' 'python-gobject' 'python-pillow')
makedepends=('python-build' 'python-installer' 'python-wheel')
optdepends=('libunrar: for rar compressed comics'
            'p7zip: for 7z compressed comics'
            'unrar: for rar compressed comics'
            'unzip: for zip compressed comics'
            'lhasa: for lha compressed comics'
            'mupdf-tools: for PDF comics')
source=("https://downloads.sourceforge.net/project/${pkgname}/MComix-${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "b6fe038db.patch"
)
md5sums=('afa6e2ba9c843e82b346b21d316dbc15'
         '6dab75dc1be41f522ce9271e1c3d62a2'
)

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -p1 < ../b6fe038db.patch
}

build(){
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
