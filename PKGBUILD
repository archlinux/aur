# Maintainer: Fabian Maurer <dark.shadow4@web.de>
# Contributor: Rafael Fontenelle <rafaelff@gnome.org>
# Contributor: Mark Weiman <mark dot weiman at markzz dot com>

_name=tevent
pkgname=lib32-${_name}
pkgver=0.9.39
pkgrel=3
pkgdesc="An event system based on the talloc memory management library (lib32)"
arch=('x86_64')
url="https://tevent.samba.org"
license=('GPL3')
source=("https://samba.org/ftp/${_name}/${_name}-${pkgver}.tar.gz")
depends=('lib32-talloc' 'tevent')
sha256sums=('f68d0fcc616119d27ebace162499e73f4ae3998e49b98d1f454bb467cdb1d4e6')

build() {
  cd ${_name}-${pkgver}

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  
  ./configure --prefix=/usr \
    --libdir=/usr/lib32 \
    --bundled-libraries=NONE \
    --builtin-libraries=replace \
    --disable-python
    
  make
}

package() {
  cd ${_name}-${pkgver}
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{include,share}
}
