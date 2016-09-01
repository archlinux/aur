# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: Martin Wimpress <code@flexion.org>

pkgname=caja-dropbox
pkgver=1.15.0
pkgrel=1
pkgdesc="Dropbox for Linux - Caja extension"
url="https://github.com/mate-desktop/caja-dropbox"
arch=('i686' 'x86_64')
license=('custom:CC-BY-ND-3' 'GPL')
depends=('caja'
         'glib2'
         'libnotify'
         'polkit'
         'procps'
         'pygtk'
         'xdg-utils')
makedepends=('mate-common' 'python2-docutils')
optdepends=('dropbox: Dropbox support')
conflicts=('caja-dropbox-gtk3')
options=('!emptydirs')
source=("https://github.com/mate-desktop/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha1sums=('632c4c3585df8ded44367ff68a45381aa2a296c4')

prepare() {
  cd "${pkgname}-${pkgver}"
  autoreconf -fi
  sed -i "s/python/python2/" configure.ac configure caja-dropbox.in Makefile.am Makefile.in rst2man.py
}

build() {
  cd "${pkgname}-${pkgver}"
  ./configure \
    --prefix=/usr \
    --disable-static
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
