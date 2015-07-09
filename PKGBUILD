# Contributer: giacomogiorgianni@gmail.com 

pkgname=vokoscreen
numver=201303021707
pkgver=2.2.0
pkgrel=1
pkgdesc="Desktop Recorder, GUI ffmpeg based on Qt4 libriaries."
arch=('i686' 'x86_64')
url="http://www.kohaupt-online.de/"
depends=('qt4' 'ffmpeg' 'lame' 'mkvtoolnix-cli' 'opencv')
makedepends=('cmake' 'automoc4' 'gcc')
source=("https://github.com/vkohaupt/vokoscreen/archive/${pkgver}.tar.gz" $pkgname.install)
#source=("http://ppa.launchpad.net/$pkgname-dev/$pkgname/ubuntu/pool/main/v/$pkgname/${pkgname}_${pkgver}-${pkgrel}#~precise1.tar.gz" $pkgname.install)
optdepends=('pulseaudio' 'alsa-utils')
#options=('!strip')
license=('GPL2')
install=${pkgname}.install
md5sums=('db3015b369c3f6531a887fc2b1492215' '027efd4ee6f24da7af118f6f99ef5909')

build() {
#  cd "${srcdir}/recipe-{debversion}"
    cd $pkgname-$pkgver
  qmake-qt4 $pkgname.pro -r -config release \
    "CONFIG+=LINUX_INTEGRATED" \
    "INSTALL_ROOT_PATH=$pkgdir/usr/" \
    "LOWERED_APPNAME=$pkgname"
 make
}

package() {
  #cd "${srcdir}/recipe-{debversion}"
  cd $pkgname-$pkgver
  make INSTALL_ROOT=${pkgdir} install
  #make DESTDIR="$pkgdir" install
  chmod -R 755 ${pkgdir}/usr/share/man
  chmod -R 755 ${pkgdir}/usr/share/man/man1
  chmod -R 644 ${pkgdir}/usr/share/man/man1/$pkgname.1.gz
}
