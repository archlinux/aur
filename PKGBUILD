# Maintainer: Gr3q <floyd0122@gmail.com>

_pkgname=yt-dlg
pkgname=$_pkgname-git
pkgver=v1.2.0.r124.g8dbf054
pkgrel=1
pkgdesc="A cross platform front-end GUI of the popular youtube-dl written in wxPython (maintained fork of youtube-dl-gui)"
arch=('any')
url="https://github.com/MrS0m30n3/youtube-dl-gui"
license=('custom:UNLICENSE')
depends=(
  'gtk-update-icon-cache'
  'python-pypubsub'
  'python-wxpython'
  'libtiff'
  'libjpeg-turbo'
)
optdepends=('ffmpeg: convert video files to audio-only files'
            'youtube-dl: alternative to the youtube-dl program downloaded by yt-dlg')
makedepends=('git')
provides=($_pkgname)
conflicts=($_pkgname youtube-dl-gui)
source=($pkgname::git+https://github.com/yt-dlg/yt-dlg.git
        yt-dlg.desktop)
sha256sums=('SKIP'
            'c0b27a97791951beafdc98fc7fc4580092a318aa49aef56bd338ed490cc7b574')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  install -Dm644 yt-dlg.desktop "$pkgdir/usr/share/applications/yt-dlg.desktop"

  cd $pkgname
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python setup.py build_trans
  python setup.py install --root="$pkgdir" --optimize=1
}

