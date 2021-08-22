# Maintainer: willemw <willemw12@gmail.com>

pkgname=sparky-tube-git
pkgver=r35.ec3a763
pkgrel=1
pkgdesc="Download a video file from a web site and convert it to audio or video output file"
arch=('any')
url="https://github.com/sparkylinux/sparky-tube"
license=('GPL3')
depends=('ffmpeg' 'xdg-user-dirs' 'yad' 'youtube-dl')
makedepends=('git')
optdepends=('vlc: play files'
            'kmplayer: play files'
            'gmplayer: play files'
            'mpv: play files'
            'smplayer: play files'
            'totem: play files'
            'qmplay2: play files'
            'rage: play files'
            'xine-ui: play files'
            'celluloid: play files')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  sed -i 's|\(/usr\)|'"$pkgdir"'\1|g' $pkgname/install.sh
}

package() {
  cd $pkgname
  install -d "$pkgdir/usr/"{bin,share/{applications,pixmaps}}
  ./install.sh
}

