# Maintainer: Deposite Pirate <dpirate at metalpunks dot info>
#
# Upstream: https://git.metalpunks.info/arch-ports

pkgname=xwpe
pkgver=1.5.30a
pkgrel=2
pkgdesc='A Borland IDE-like text editor'
arch=('i686' 'x86_64')
url='http://www.identicalsoftware.com/xwpe'
license=('GPL2')
depends=('ncurses' 'gpm' 'zlib')
optdepends=('libx11' 'libsm')
source=("${url}/${pkgname}-${pkgver}.tar.gz"
        'xwpe-1.5.30a-build.patch')
sha256sums=('fce37a5dd3afd7102a73d187eda8b9d1ab88bf5db649f385b8cd13e72e0c7961'
            '0751f172ce6d442f59c69e6f401fd77c20a60479ce6b577c0f77b35dd40d0252')

prepare() {
  cd "${pkgname}-${pkgver}"

  # Fix and improve build
  patch -p1 -i ../xwpe-1.5.30a-build.patch
}

build() {
  cd "${pkgname}-${pkgver}"
  CFLAGS="${CFLAGS}" ./configure \
   --prefix=/usr \
   --libdir=/usr/share
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make install DESTDIR="${pkgdir}"
  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 CHANGELOG README "${pkgdir}/usr/share/doc/${pkgname}"
}
