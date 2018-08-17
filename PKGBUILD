# Maintainer: Roman Mikhayloff <rimf@inbox.ru>

pkgname=expertguide
_srcname=eg
pkgver=1.01
pkgrel=1
pkgdesc="Expert Guide, a Norton Guide reader for GNU/Linux"
arch=('i686' 'x86_64')
url="http://www.davep.org/norton-guides/"
license=('GPL')
depends=('slang')
provides=('expertguide')
conflicts=('expertguide-git' 'eg')
source=("https://github.com/davep/eg/archive/${_srcname}-v${pkgver}.tar.gz"
        "build.patch"
        )
sha1sums=('1287c9c5d6a8e5b0b90b530128f639d7f586bfd2'
          '872b7364e7149f788d1ab814ac907dc302cae335')

prepare() {
  mv "${srcdir}/${_srcname}-${_srcname}-v${pkgver}" "${srcdir}/${pkgname}"
  cd "${srcdir}/${pkgname}"
  patch -Np1 -i "${srcdir}/build.patch"
}

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"

  #make DESTDIR="${pkgdir}" install
  install -D eg -t "${pkgdir}/usr/bin"
  install -Dm644 eg.1 -t "${pkgdir}/usr/share/man/man1"
  install -Dm644 default-guide/eg.ng -t "${pkgdir}/usr/share/norton-guides"
}
