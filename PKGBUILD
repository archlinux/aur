# Maintainer: Naleo Hyde <naleo dot hyde at gmail dot com>
# Contributor: Szymon Scholz < szymonscholz at gmail dot com >
# Contributor: Frederic Bezies < fredbezies at gmail dot com>
# Contributor: Larry Hajali <larryhaja[at]gmail[dot]com>
# Contributor: carstene1ns <arch carsten-teibes de>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: archtux <antonio.arias99999 at gmail.com>

pkgname=bitfighter
pkgver=021
pkgrel=1
pkgdesc="A fast-paced team-based outer-space multi-player combat game"
arch=('i686' 'x86_64')
url="http://bitfighter.org/"
license=('GPL')
depends=(
    'sqlite'
	'sdl2'
	'libpng'
	'openal'
	'libvorbis'
	'libmodplug'
	'speex'
)
makedepends=(
	'cmake>=3.1.0'
	'gcc'
	'glu'
)
source=("http://${pkgname}.org/files/${pkgname}-${pkgver/./}.tar.gz"
        "http://bitfighter.org/files/classic_level_pack.zip"
        "$pkgname.png"
        "$pkgname.desktop")
build() {
  echo " ${CPPFLAGS}"
  export CFLAGS+=" ${CPPFLAGS}"
  export CXXFLAGS+=" ${CPPFLAGS}"
  cmake -B build -S "bitfighter-${pkgver}" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Wno-dev
  make -C build
}

package() {
  cd $pkgname-${pkgver/./}

  # install game ressources and executable
  install -d "$pkgdir"/usr/share/$pkgname "$pkgdir"/usr/bin
  cp "${srcdir}"/classic_level_pack/* resource/levels
  cp -r resource/* "$pkgdir"/usr/share/$pkgname
  install -m755 exe/$pkgname "$pkgdir"/usr/bin/$pkgname

  # install a desktop entry
  install -Dm644 ../$pkgname.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
  install -Dm644 ../$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop

  # install documentation and license
  install -Dm644 doc/README.txt "$pkgdir"/usr/share/doc/$pkgname/README
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}


md5sums=('2d2c33abca2e322c1d6c8e1998add3c3'
         'cb32039b47026e176d3f1f3639bd1a9f'
         '8b28490af9deadd0a1a104ae372f5b08'
         '657e0ff146dd3dac682e15be5a74fbf0')
