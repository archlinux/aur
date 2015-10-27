# Maintainer: dracorp <piotr.r.public@gmail.com>
# Contributor: 3ED <krzysztof1987@gmail.com>

pkgname=napi-bash-git
_pkgname=napi-bash
pkgver=v1.1.rc1.3.g60fc8ebc
pkgrel=1
pkgdesc="Lightweight, easy and fast polish subtitle downloader from the napiprojekt.pl"
arch=('any')
url="http://3ed.github.io/napi-bash/"
license=('GPL')
depends=('bash>=4.1' 'curl' 'p7zip' 'coreutils' 'findutils')
provides=(napi-bash)
conflicts=(napi-bash)
optdepends=(
'notification-daemon: dla wersji GUI/GTK'
'dos2unix: konwertowanie znaku konca linii dos/unix'
'subotage: konwertowanie formatów (nie wymagane dla detekcji)'
'ffmpeg: detektor FPS dla subotage'
'mediainfo: detektor FPS dla subotage'
'mplayer: detektor FPS dla subotage'
'bc: kalkulator dla ffmpeg'
)
source=(git://github.com/3ed/napi-bash.git)
_gitname='napi-bash'
sha256sums=('SKIP')

pkgver(){
  if [ -d "$srcdir"/$_gitname ]; then
    cd "$srcdir"/$_gitname
    git describe --always | sed 's|-|.|g'
  fi
}
package() {
  cd "$_pkgname"
  ./autogen.sh
  ./configure --prefix=/usr
  make install PREFIX="/usr" DESTDIR="$pkgdir"
}
