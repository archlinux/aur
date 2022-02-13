# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Paul Bredbury <brebs@sent.com>
# Contributor: Matt McDonald <metzen@gmail.com>

pkgname=libpar2
pkgver=0.2
pkgrel=9
pkgdesc='Parity checking library'
arch=('x86_64')
url='http://parchive.sourceforge.net'
license=('GPL')
depends=('libsigc++')
source=("http://downloads.sourceforge.net/sourceforge/parchive/${pkgname}-${pkgver}.tar.gz"
        'libpar2-0.2-bugfixes.patch'
        'libpar2-0.2-cancel.patch'
        )
sha256sums=('074fbf840f73b1e13e0405fce261078c81c8c0a4859e30a7bba10510f9199908'
            'bcdb0cf45b97b99bc2fb05074887bd73be15745d5d2ce94d65bd0e0c248fb341'
            'b05e08033dd2056b47c5610a5bd1d74b93dc283d2f798bfc0d3d9e3fd4f9da14'
            )

prepare() {
  mkdir -p build

  patch -d "${pkgname}-${pkgver}" -p2 -i "${srcdir}/libpar2-0.2-bugfixes.patch"
  patch -d "${pkgname}-${pkgver}" -p2 -i "${srcdir}/libpar2-0.2-cancel.patch"
}

build() {
  cd build

  export CXXFLAGS="$CXXFLAGS -std=gnu++11"
  "../${pkgname}-${pkgver}/configure" \
    --prefix=/usr

  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install

# Docs
  cd "${pkgname}-${pkgver}"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}/" AUTHORS PORTING README ROADMAP
}
