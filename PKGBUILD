# Maintainer: Ivan Zenin <i.zenin@gmx.com>

pkgname="wxbase"
pkgver=3.1.0
pkgrel=4
pkgdesc="wxWidgets base libraries for no X install (3.x branch stable version)"
arch=('i686' 'x86_64')
url="http://wxwidgets.org"
license=('custom:wxWindows')
makedepends=('git')
provides=('wxbase=3.1.0')
conflicts=('wxgtk' 'wxwidgets' 'wxbase')
source=("git+git://github.com/wxWidgets/wxWidgets.git#tag=v3.1.0")
md5sums=('SKIP')

build() {
  cd "${srcdir}/wxWidgets"
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
  cd "${srcdir}/wxWidgets"
  make DESTDIR="${pkgdir}" install
  find "${pkgdir}" -type d -name .git -exec rm -r '{}' +
  install -D -m644 docs/licence.txt "${pkgdir}/usr/share/licenses/wxWidgets/LICENSE"
}
