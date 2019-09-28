# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=lib32-cloog
_pkgbasename=cloog
pkgver=0.20.0
pkgrel=1
pkgdesc="Library that generates loops for scanning polyhedra"
arch=('x86_64')
url="http://www.bastoul.net/cloog/"
depends=('lib32-osl' 'lib32-isl')
makedepends=('texlive-core' 'texlive-bin')
license=('GPL')
source=("https://github.com/periscop/cloog/releases/download/$_pkgbasename-$pkgver/$_pkgbasename-$pkgver.tar.gz")
sha512sums=('d00cbefd348b45d9d482320a088f7ae736440046b99469cbdfbb177a38dcef182c3305f0a567a1f5699c23b7108db6fd5ad6dfbc071d63ccca1d6bfc1b198565')

prepare() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
}

build() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  export LDFLAGS+=' -m32'
  
  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --with-isl=system \
    --with-osl=system
  make
}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}
  rm -f "${pkgdir}/usr/lib32/"*.py
}
