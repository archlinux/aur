# Maintainer: Jose Riha <jose 1711 gmail com>
# Contributor: Dan Serban
# Contributor: mickael9

pkgname=algodoo
pkgver=1.x.x.latest
pkgrel=2
pkgdesc="A physics simulator program for education and fun (based on phun)"
arch=(i686)
url=http://www.algodoo.com/
license=(custom:commercial)
depends=(boost-libs curl glew libjpeg6 libpng12 libzip mesa pango sdl_image libcurl-gnutls)
source=(algodoo.desktop)
makedepends=(lynx)
md5sums=('c1baec0f7e0ae085a7b41116d7500912')

build(){
:
}

package()
{
  rm algodoo.tgz 2>/dev/null || true
  _url=$(lynx -dump "http://www.algodoo.com/wiki/Download" | grep -o http.*download.algodoo_.*Linux32.tgz)
  wget -O algodoo.tgz "${_url}"
  bsdtar -xf algodoo.tgz
  cd tarball
  mv Algodoo algodoo
  mkdir -p "${pkgdir}"/usr/share
  mv algodoo "${pkgdir}"/usr/share/
  cd "${pkgdir}"/usr/share/algodoo/lib
  ln -s libcxcore.so.2 libcxcore.so.1
  ln -s libcv.so.2 libcv.so.1
  ln -s libhighgui.so.2 libhighgui.so.1
  mkdir -p "${pkgdir}"/usr/bin
  USRBINFILE="${pkgdir}"/usr/bin/algodoo
  echo '#!/bin/bash' > "${USRBINFILE}"
  echo 'export LD_LIBRARY_PATH="/usr/share/algodoo/lib:${LD_LIBRARY_PATH}"' >> "${USRBINFILE}"
  echo 'exec /usr/share/algodoo/algodoo.bin' >> "${USRBINFILE}"
  chmod +x "${USRBINFILE}"
  install -Dm644 $pkgdir/usr/share/algodoo/data/logos/icon.bmp $pkgdir/usr/share/pixmaps/algodoo.bmp
  install -Dm644 $srcdir/algodoo.desktop $pkgdir/usr/share/applications/algodoo.desktop
}

