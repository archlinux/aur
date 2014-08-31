# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=xbak
pkgver=0.1.5
pkgrel=1
pkgdesc='A fan-made remake of the classic Sierra computer RPG "Betrayal at Krondor"'
arch=('i686' 'x86_64')
url="http://xbak.sourceforge.net"
license=('GPL3')
depends=('sdl_sound' 'sdl_mixer')
install=xbak.install
source=("http://downloads.sourceforge.net/xbak/xbak-$pkgver.tar.bz2"
        "xbak.sh")
sha256sums=('fa1044f30478b4a771aa12f7b2dc15c76408e243ac35083e0f8fd1817b225be2'
            '8e232e2024c5fdaa9ffd994e04335cf15cd4b92637935a54db29941582335460')

build() {
  cd xbak-$pkgver

  ./configure --prefix=/usr
  make
}

package() {
  # launcher
  install -Dm755 xbak.sh "$pkgdir"/usr/bin/xbak

  cd xbak-$pkgver
  # binary
  install -Dm755 src/xbak "$pkgdir"/usr/lib/xbak/xbak
  # docs
  install -d "$pkgdir"/usr/share/doc/xbak
  install -m644 README ChangeLog NEWS "$pkgdir"/usr/share/doc/xbak
}
