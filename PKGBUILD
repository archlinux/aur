# Maintainer Vova Abdrakhmanov <369565@gmail.com>

pkgname=gala-layoutpw-plugin
pkgver=6.3.1
pkgrel=1
pkgdesc='Gala plugin to switch layouts per window'
arch=('x86_64')
url='https://github.com/Dirli/gala-layoutpw-plugin'
license=('GPL3')
depends=('glib2' 'glibc' 'libgee' 'gala' )
makedepends=('meson' 'vala')
source=(${pkgname}-6.3.0.tar.gz::https://github.com/Dirli/gala-layoutpw-plugin/archive/refs/tags/6.3.0.tar.gz
        gala-${pkgver}.tar.gz::https://github.com/elementary/gala/archive/refs/tags/${pkgver}.tar.gz
        6.3.1.patch)
sha256sums=('85b6544f9d362d98bc9cb6420d861476e8bbc26758d456597391a06fa04e6291'
            'f2aad3c51d576baa2f5dd0c5ec790ba3344d7a80add5bfb91ccb86eb28424635'
            '3aee1250989ece4ea82235dfdd35bc977f88e3d053fd525573a86711df14cad7')
install='install.sh'

build() {
  cp gala-${pkgver}/vapi/* ${pkgname}-6.3.0/vapi/
  cd ${pkgname}-6.3.0 && patch -p1 < ../6.3.1.patch && cd ..
  arch-meson ${pkgname}-6.3.0 build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

#vim: syntax=sh
