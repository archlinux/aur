# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Jan Blazek <appolito@gmail.com>
# Contributor: Jose Valecillos <valecillosjg (at) gmail (dot) com>

pkgname=gtkimageview
pkgver=1.6.4
pkgrel=9
pkgdesc='Simple image viewer widget for GTK2'
arch=('x86_64')
url='https://wiki.gnome.org/Projects(2f)GTK(2f)GtkImageView.html'
license=('LGPL2.1')
depends=('gtk2')
makedepends=('pkg-config' 'python' 'gnome-common')
source=("https://sources.archlinux.org/other/packages/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('4c681d38d127ee3950a29bce9aa7aa8a2abe3b4d915f7a0c88e526999c1a46f2')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  sed -i 's/-Werror//' configure.in
  ./autogen.sh
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --disable-static

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}/usr/share"
}
