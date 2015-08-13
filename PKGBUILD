# Maintainer: Andrejs Mivreņiks <gim at fastmail dot fm>
pkgname=fmod
pkgver=1.06.08
pkgrel=1
pkgdesc="Interface for programmers to load FMOD Studio projects and play them back in realtime"
arch=('i686' 'x86_64' 'arm' 'armhf')
url="http://www.fmod.org/download/"
license=('custom')
changelog='revision.txt'
source=("http://www.fmod.org/download/fmodstudio/api/Linux/fmodstudioapi${pkgver//[.]/}linux.tar.gz")
sha256sums=('20c84678854688f776ca7ae06399700ec7f6b582e0c170d41e779e575c6ab395')

package() {
  _carch=''
  case "$CARCH" in
    x86_64) _carch='x86_64';;
    i686) _carch='x86';;
    arm) _carch='arm';;
    armhf) _carch='armhf';;
  esac

  cd "fmodstudioapi${pkgver//[.]/}linux"
  install -d "$pkgdir/usr/"{lib,include,share/doc}
  # lowlevel
  install -m644 api/lowlevel/lib/$_carch/* "$pkgdir/usr/lib/"
  install -m644 api/lowlevel/inc/* "$pkgdir/usr/include/"
  # studio
  install -m644 api/studio/lib/$_carch/* "$pkgdir/usr/lib/"
  install -m644 api/studio/inc/* "$pkgdir/usr/include/"
  # docs
  install -m644 doc/* "$pkgdir/usr/share/doc/"
  install -Dm644 doc/LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
