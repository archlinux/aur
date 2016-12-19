# Contributor: Sebastian Wolf <fatmike303@gmail.com>
pkgname=advancemame
pkgver=3.0
pkgrel=1
pkgdesc="AdvanceMAME allows you to play Arcade games with video hardware like TVs, Arcade monitors, PC monitors and LCD screens. Also includes AdvanceMENU frontend."
arch=('i686' 'x86_64' 'armv7h')
url="http://www.advancemame.it"
depends=('sdl' 'alsa-lib' 'expat' 'freetype2' 'slang')
conflicts=('advancemenu')
license=('GPL')
source=("https://github.com/amadvance/advancemame/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('19077f55ab636ac8e996d87775a1eb86c2ced381cbcd57c1e0c0bf410f4b4101')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr || return 1
  make || return 1
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make bindir="${pkgdir}/usr/bin/" \
       datadir="${pkgdir}/usr/share/" \
       mandir="${pkgdir}/usr/share/man/" \
       pkgdocdir="${pkgdir}/usr/share/doc/${pkgname}/" \
       install
}

