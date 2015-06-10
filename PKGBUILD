# Maintainer: André Silva <emulatorman@parabola.nu>
# Contributor: Márcio Silva <coadde@parabola.nu>

pkgname=webp-npapi
pkgver=1.0.0.0
pkgrel=1
pkgdesc="A WebP plugin for NPAPI-compliant browsers on GNU/Linux"
arch=('i686' 'x86_64' 'mips64el')
url="https://code.google.com/p/webp-npapi-linux/"
license=('APACHE')
depends=('libwebp')
makedepends=('subversion' 'gtk2')
source=('webp-npapi::svn+https://webp-npapi-linux.googlecode.com/svn/trunk/'
        'ftp://gnu.mirror.iweb.com/icecat/4.0/icecat-4.0.tar.xz')
md5sums=('SKIP'
         '04548bfd70e6a66cd75cdb1f1fc81eb4')
options=('!makeflags')

prepare() {
  cd "$srcdir/webp-npapi"
  sed -i 's|[.][.][/][.][.][/]include[/]|../icecat-4.0/modules/plugin/base/public/|g;
         ' webp-npapi.h \
           CPlugin.h           
}

build() {
  cd "$srcdir/webp-npapi"
  make all
}

package() {
  cd "$srcdir/webp-npapi"
  install -d "$pkgdir/usr/lib/mozilla/plugins/"
  install -m644 *.so "$pkgdir/usr/lib/mozilla/plugins/"
}
