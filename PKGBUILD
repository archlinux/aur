# Maintainer : silverhikari <kerrickethan@gmail.com>
# Contributor: evertonstz

pkgname=pkg2zip-fork
pkgver=2.6
pkgrel=3
pkgdesc="This is for lusid1's fork, recomended by NoPayStation. Decrypts PlayStation Vita pkg file and packages to zip archive"
url='https://github.com/lusid1/pkg2zip'
arch=('i686' 'x86_64')
license=('Unlicense')
provides=('pkg2zip')
conflicts=('pkg2zip' 'pkg2zip-git')
source=("https://github.com/lusid1/pkg2zip/archive/${pkgver}.tar.gz" "memset.patch" "naxora_fix.patch")
sha256sums=('SKIP' '02f389f04c7971f9c8130fe9a28d23aa1a052607411ceb361e02d83da57bb2bf' "359a24408754da727b23d2546faf3c6c2b2becfe47416619a5dfb684951ffc31")

prepare() {
cd "${srcdir}/pkg2zip-${pkgver}"
patch -p1 -i "../memset.patch"
patch -p1 -i "../naxora_fix.patch"
}

build() {
cd "${srcdir}"/"pkg2zip-${pkgver}"
make
}

package() {
  cd "${srcdir}"/"pkg2zip-${pkgver}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/pkg2zip/LICENSE"
  install -Dm755 pkg2zip "${pkgdir}/usr/bin/pkg2zip"
}
