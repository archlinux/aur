# Maintainer: Kirill Pshenichnyi <pshcyrill@mail.ru>
# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>
# Contributor: The Tango Controls community
#              (https://tango-controls.org) <info@tango-controls.org>

pkgname=tango-idl
pkgver=5.1.2
pkgrel=1
groups=('tango-controls')
pkgdesc="This is the Tango CORBA IDL file."
arch=('x86_64' 'armv7h')
url="https://www.tango-controls.org/"
license=('GPL3')
depends=('cmake>=3.7')
conflicts=('tango-idl-git')
source=("https://gitlab.com/tango-controls/tango-idl/-/archive/${pkgver}/tango-idl-${pkgver}.tar.gz"
	"version-fix.patch")
sha256sums=('b0a955d14c6c88fe331e2323205522a3710a4aa1909c1e7f3ee3acc371a5a77d'
            'fd4734107be21dcfc3388efef6ac1ebc3645956756c10ced0b956edee9cddb2d')
_dir="${pkgname}-${pkgver}"


prepare() {
  cd "${pkgname}-${pkgver}"
  patch -N --input="${srcdir}/version-fix.patch"
}

build() {
  cmake -B build -S "${pkgname}-${pkgver}" -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
