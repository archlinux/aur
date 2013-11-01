# Contributor: Jan Cholasta <grubber@grubber.cz>
# Maintainer: Jan Cholasta <grubber@grubber.cz>

pkgname=zdbsp
pkgver=1.17
pkgrel=1
pkgdesc="A node builder optimized for ZDoom WADs"
arch=('i686' 'x86_64')
url="http://www.zdoom.org/"
license=('GPL2')
depends=('gcc-libs' 'zlib')
makedepends=('cmake')
source=(http://zdoom.org/files/utils/${pkgname}-${pkgver}-src.zip)
noextract=(${pkgname}-${pkgver}-src.zip)
md5sums=('3868c13982eac42c9ac49a681946d5ce')

build() {
  cd "$srcdir"

  unzip -d ${pkgname}-${pkgver} -o -q ${pkgname}-${pkgver}-src.zip || return 1

  cd ${pkgname}-${pkgver}

  cmake -DCMAKE_BUILD_TYPE=Release . || return 1
  make || return 1
}

package() {
  cd "$srcdir"/${pkgname}-${pkgver}

  install -m755 -D zdbsp "$pkgdir"/usr/bin/zdbsp
}
