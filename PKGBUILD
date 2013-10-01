# Maintainer: carstene1ns <arch carsten-teibes de>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=clanlib-23
pkgver=2.3.7
pkgrel=1
pkgdesc="A multi-platform game development library (legacy 2.3 branch)."
arch=('i686' 'x86_64')
url="http://clanlib.org/"
license=('zlib')
depends=('alsa-lib' 'libjpeg' 'libmikmod' 'libpng' 'libvorbis' 'libxi' 'libxmu' 'sdl_gfx' 'freetype2' 'pcre' 'sqlite' 'libgl')
makedepends=('mesa')
options=('!libtool')
source=("http://clanlib.org/download/releases-2.0/ClanLib-2.3.7.tgz")
md5sums=('65c9881286c47bbe88b2b691aacbc05b')
sha256sums=('d46127c08103f48d15936ceb9f95b3dfb1ff8ccba667cef1b3f8e639cb2601c2')

build() {
  cd ${srcdir}/ClanLib-${pkgver}

  ./autogen.sh

  # disable legacy gl1 renderer and documentation
  ./configure --prefix=/usr --disable-clanGL1 --disable-docs

  make
}

package() {
  cd ${srcdir}/ClanLib-${pkgver}

  make DESTDIR=${pkgdir} install

  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  install -m644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/
}
