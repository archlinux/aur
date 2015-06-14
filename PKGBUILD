# Maintainer: Andrejs Mivreņiks <gim at fastmail dot fm>
pkgname=fmod
pkgver=1.06.04
pkgrel=1
pkgdesc="Interface for programmers to load FMOD Studio projects and play them back in realtime"
arch=('i686' 'x86_64' 'arm' 'armhf')
url="http://www.fmod.org/download/"
license=('custom')
changelog='revision.txt'
source=("http://www.fmod.org/download/fmodstudio/api/Linux/fmodstudioapi${pkgver//[.]/}linux.tar.gz")
sha256sums=('65072ea78c4c1fba58c9fd9c47361c3189eaa805e1153912446373ef0e5fca8a')

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
  install -m0644 api/lowlevel/lib/$_carch/* "$pkgdir/usr/lib/"
  install -m0644 api/lowlevel/inc/* "$pkgdir/usr/include/"

  # studio
  install -m0644 api/studio/lib/$_carch/* "$pkgdir/usr/lib/"
  install -m0644 api/studio/inc/* "$pkgdir/usr/include/"

  install -m0644 doc/* "$pkgdir/usr/share/doc/"
  install -Dm0644 doc/LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
