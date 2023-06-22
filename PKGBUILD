pkgname=wxbase3.0
pkgver=3.0.5.1
pkgrel=1
pkgdesc="wxWidgets base libraries for no X install (3.0 branch stable version)"
arch=("i686" "x86_64")
url="http://wxwidgets.org"
license=("custom:wxWindows")
provides=("wxbase3.0")
conflicts=("wxgtk" "wxwidgets")
source=("https://github.com/wxWidgets/wxWidgets/releases/download/v${pkgver}/wxWidgets-${pkgver}.tar.bz2")
sha1sums=("406ac736f61d88a3a866aa501e01e408a642c6e7")

build() {
  cd "${srcdir}/wxWidgets-${pkgver}"
  ./configure \
 	  --prefix=/usr \
	  --libdir=/usr/lib \
	  --disable-gui \
	  --disable-compat28 \
	  --enable-unicode \
	  --disable-precomp-headers
  make
}

package() {
  cd "${srcdir}/wxWidgets-${pkgver}"
  make DESTDIR="${pkgdir}" install
  find "${pkgdir}" -type d -name .git -exec rm -r '{}' +
  install -D -m644 docs/licence.txt "${pkgdir}/usr/share/licenses/wxWidgets/LICENSE"
}
