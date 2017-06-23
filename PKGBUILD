# Maintainer: willemw <willemw12@gmail.com>
# Contributor: B4SH-B00STER

_pkgname=youtube-dl-gui
pkgname=$_pkgname-git
pkgver=0.3.8.r447.g182a587
pkgrel=2
pkgdesc="A cross platform front-end GUI of the popular youtube-dl written in wxPython"
arch=('any')
url="https://github.com/MrS0m30n3/youtube-dl-gui"
license=('custom:UNLICENSE')
#depends=('gtk-update-icon-cache' 'python2-twodict' 'wxpython')
depends=('gtk-update-icon-cache' 'python2-twodict-git' 'wxpython')
optdepends=('ffmpeg: convert video files to audio-only files'
            'youtube-dl: alternative to the youtube-dl program downloaded by youtube-dl-gui')
makedepends=('git')
provides=($_pkgname)
conflicts=($_pkgname)
source=($pkgname::git://github.com/MrS0m30n3/youtube-dl-gui.git
        youtube-dl-gui.desktop)
md5sums=('SKIP'
         '298421ed0a9e2c6475e0bb3f86d2d2a7')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  install -Dm644 youtube-dl-gui.desktop "$pkgdir/usr/share/applications/youtube-dl-gui.desktop"

  cd $pkgname
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python2 setup.py install --root="$pkgdir" --optimize=1
}

