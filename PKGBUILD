# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: Jack L. Frost <fbt@fleshless.org>
# Contributor: Corelli <corelli AT sent DOT com>
# Contributor: BartÅ‚omiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: intelfx <intelfx100 [at] gmail [dot] com>
# Contributor: Behem0th <grantipak@gmail.com> 
# Contributor: zman0900 <zman0900@gmail.com>

pkgname=freshplayerplugin-git
pkgver=0.3.9.r6.g58596f4
pkgrel=1
pkgdesc='PPAPI-host NPAPI-plugin adapter.'
arch=('i686' 'x86_64')
url='https://github.com/i-rinat/freshplayerplugin'
license=('MIT')
depends=('pango' 'alsa-lib' 'freetype2' 'libevent' 'libgl' 'v4l-utils' 'ffmpeg' 'icu' 'libxrandr' 'libxcursor' 'pepper-flash')
makedepends=('cmake' 'ragel' 'git')
conflicts=('freshplayerplugin')
source=("${pkgname}::git+${url}")
sha1sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags | sed -e 's:v::' -e 's:-:.r:' -e 's:-:.:g'
}

prepare() {
  mkdir -p ${pkgname}/build
}

build() {
  cd ${pkgname}/build
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd ${pkgname}/build
  make DESTDIR="${pkgdir}" install

  install -Dm644 ../data/freshwrapper.conf.example "${pkgdir}/usr/share/${pkgname}/freshwrapper.conf.example"
  install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
