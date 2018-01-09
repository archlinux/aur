pkgname=mal-gtk
pkgver=latest
pkgrel=1
pkgdesc="GTK+3 interface for MyAnimeList.net"
url="https://github.com/filalex77/${pkgname}"
license=('GPLv3')
arch=('any')
depends=('gtkmm3' 'libsecret' 'libxml2' 'libcurl.so')
makedepends=('meson' 'python>=3')
source=(git+https://github.com/filalex77/${pkgname}.git
	'mal-gtk.desktop')
md5sums=('SKIP'
	 'e2fd1a6db4a0bd70cca3195023ca7e72')

build() {
  cd ${srcdir}/${pkgname}
  [[ -d build ]] && rm -rf build
  mkdir build && cd build
  PKG_CONFIG_PATH=`pwd`/../pkgconfig meson --prefix /usr
  ninja
}

package() {
  cd ${srcdir}/${pkgname}/build
  DESTDIR=${pkgdir} ninja install

  # .desktop
  mkdir -p "$pkgdir"/usr/share/applications
  install -m644 ${srcdir}/${pkgname}.desktop "$pkgdir"/usr/share/applications
}
