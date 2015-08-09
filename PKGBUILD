# Maintainer: Mirco Tischler <mt-ml at gmx dot de>

pkgname=fwupd
pkgver=0.1.4
pkgrel=1
pkgdesc='A simple daemon to allow session software to update firmware'
arch=('i686' 'x86_64')
url='https://github.com/hughsie/fwupd'
license=('GPL2')
depends=('appstream-glib>=0.3.5' 'fwupdate')
makedepends=('docbook2x' 'intltool')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        "docbook-sgml-arg.patch")
sha256sums=('6603ceaa6c170f3c4efed0beeed5b52a3447007b7b700f660afd3ab95977e723'
            '9fc817a1d8c3d960e032a03f6ebe9b6d122175258e54129f0b3696d307f43a04')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  patch -p1 < ../"${source[1]}"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib/fwupd --enable-colorhug --enable-uefi --disable-rpath
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
