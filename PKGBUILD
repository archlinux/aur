# Maintainer: mrxx <mrxx at cyberhome dot at>
# Contributor: Valère Monseur <valere dot monseur at ymail dot com>
# Contributor: Johan "Slikkie" van der Slikke <johan@slikkie.nl>

pkgname=gexif
pkgver=0.5
pkgrel=6
pkgdesc='View and edit the EXIF tags contained in JPG and TIFF files'
arch=('i686' 'x86_64')
url='https://libexif.github.io'
license=('GPL')
depends=('libexif-gtk')
makedepends=('git')
source=("git+https://github.com/libexif/$pkgname.git"
        "gexif.desktop")
md5sums=('SKIP'
         'c717c9f555d17eabb0dd63d35f0bb5d9')

build() {
  cd "${srcdir}/${pkgname}"

  autoreconf -if
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}"

  make DESTDIR="${pkgdir}" install
  install -D -m644 "${srcdir}"/$pkgname.desktop "${pkgdir}"/usr/share/applications/$pkgname.desktop
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
