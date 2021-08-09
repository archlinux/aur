# Maintainer: Cezary Drożak <czarek@drozak.net>
# Contributor: TDY <tdy@gmx.com>
# Contributor: Eduard "bekks" Warkentin <eduard.warkentin@gmail.com>
# Contributor: Luke Shumaker <lukeshu@sbcglobal.net>
# Contributor: Miguel Revilla <yo@miguelrevilla.com>

_pkgname=gmdb2
_pkgver=0.9.0-beta3
_srcname="${_pkgname}-${_pkgver}"
pkgname=gmdb2-beta
pkgver=${_pkgver//-/_}
pkgrel=2
provides=("gmdb2=$pkgver")
pkgdesc="Graphical viewer for Microsoft Access database files"
arch=('i686' 'x86_64')
url="https://github.com/mdbtools/gmdb2"
license=('GPL')
depends=('mdbtools>=0.9.0' 'gtk3>=3.22')
makedepends=('yelp-tools' 'txt2man' 'desktop-file-utils')
optdepends=('gawk: for documentation'
            'yelp: for documentation')
source=("${_srcname}.tar.gz::$url/archive/v${_pkgver}.tar.gz")
md5sums=('d9f0a9cbd7a546111028e6804f9ca2ae')
install=gmdb2.install

prepare() {
  cd "${srcdir}/${_srcname}"
  autoreconf -i -f
}

build() {
  cd "${srcdir}/${_srcname}"
  ./configure --prefix=/usr --sysconfdir=/etc --mandir=/usr/share/man \
              --with-unixodbc=/usr
  make
}

package() {
  cd "${srcdir}/${_srcname}/src"
  make DESTDIR="${pkgdir}" install
  install -Dm644 gmdb.desktop "$pkgdir"/usr/share/applications/gmdb2.desktop
  install -Dm644 ../mdbtools.gmdb2.gschema.xml "$pkgdir"/usr/share/glib-2.0/schemas/mdbtools.gmdb2.gschema.xml
}
