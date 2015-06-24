# Maintainer: Mirco Tischler <mt-ml at gmx dot de>

pkgname=fwupd
pkgver=0.1.3
pkgrel=1
pkgdesc='A simple daemon to allow session software to update firmware'
arch=('i686' 'x86_64')
url='https://github.com/hughsie/fwupd'
license=('GPL2')
depends=('libgcab' 'appstream-glib>=0.3.5' 'fwupdate' 'gpgme' 'colord')
makedepends=('docbook2x')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        "docbook-sgml-arg.patch")
sha256sums=('1fc73412301833dfd6cb0c5117765d39ef02b7fa303c892c6c13d1dec54e9334'
            '983dd26a21dad2f61d706ff610acdee5df88a2d17b301fd153bcd2662d33422a')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  patch -p1 < ../"${source[1]}"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib/fwupd --enable-colorhug --enable-uefi
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
