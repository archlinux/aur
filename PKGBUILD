# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>
# Contributor: 3ED <krzysztof1987@gmail.com>

pkgname=napi-bash-git
_pkgname=napi-bash
pkgver=v1.1.0.r0.g89897ca
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
    ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" )
  fi
}
package() {
  cd "$_pkgname"
  ./autogen.sh
  ./configure --prefix=/usr
  make install PREFIX="/usr" DESTDIR="$pkgdir"
}
