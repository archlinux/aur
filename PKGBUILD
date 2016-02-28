# Contributor: jospehgbr <rafael.f.f1@gmail.com>
# Maintainer: GordonGR <ntheo1979@gmail.com>

_pkgname=enca
pkgname=lib32-${_pkgname}
pkgver=1.18
pkgrel=1
pkgdesc="Charset analyser and converter (32 bit)"
arch=('x86_64')
url="http://cihar.com/software/enca/"
license=('GPL')
depends=('recode' "${_pkgname}")
source=("http://dl.cihar.com/${_pkgname}/${_pkgname}-${pkgver}.tar.xz")
md5sums=('a139a6ba811c375f50947f9c547b3306')

build() {
export CC='gcc -m32'  
cd ${_pkgname}-${pkgver}
./configure --prefix=/usr \
            --libexecdir=/usr/lib32 \
            --mandir=/usr/share/man \
            --with-librecode=/usr \
            --enable-external \
            --libdir=/usr/lib32
make
}

package() {
make -C ${_pkgname}-${pkgver} DESTDIR="${pkgdir}" install
rm -rf "${pkgdir}"/usr/{bin,include,share}
}
