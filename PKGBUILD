# Maintainer:
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Tobias Kieslich <tobias@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=obconf
pkgver=2.0.4
pkgrel=7
pkgdesc="A GTK+ based configuration tool for the Openbox windowmanager"
arch=('x86_64')
url="http://openbox.org/wiki/ObConf:About"
license=('GPL')
depends=('openbox' 'gtk3' 'libobrender.so')
source=("http://openbox.org/dist/$pkgname/$pkgname-$pkgver.tar.gz"{,.asc}
        stop-using-libglade.patch
        switch-to-gtk3.patch)
md5sums=('9271c5d2dc366d61f73665a5e8bceabc'
         'SKIP'
         '6be2148229280c3ba961f7aad928bc27'
         'fb2c56d8e62bfbadd6ed6a735b0e10c2')
validpgpkeys=(1FEECBB03AB7D3216B5E0AC9274E52855D203EC3)

prepare() {
  cd "${srcdir}"/${pkgname}-${pkgver}

  # Stop using libglade, and switch to GTK+ 3
  patch -Np1 -i "${srcdir}"/stop-using-libglade.patch
  patch -Np1 -i "${srcdir}"/switch-to-gtk3.patch
  autoreconf -fi
}

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}

  #./bootstrap
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
