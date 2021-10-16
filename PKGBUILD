# Maintainer: Gr3q <floyd0122@gmail.com>

_pkgname=yt-dlg
pkgname=$_pkgname-git
pkgver=1.2.0.r150.g4ac8184
pkgrel=1
pkgdesc="A cross platform front-end GUI of the popular youtube-dl written in wxPython (maintained fork of youtube-dl-gui)"
arch=('any')
url="https://github.com/oleksis/youtube-dl-gui"
license=('custom:UNLICENSE')
depends=(
  'python-pypubsub'
  'python-wxpython'
  'xdg-utils'
)
optdepends=('ffmpeg: convert video files to audio-only files'
            'youtube-dl: alternative to the youtube-dl program downloaded by yt-dlg')
makedepends=('git' 'python-polib' 'python-setuptools')
provides=($_pkgname)
conflicts=($_pkgname youtube-dl-gui)
source=($pkgname::git+https://github.com/yt-dlg/yt-dlg.git)
sha256sums=('SKIP')

pkgver() {
  git -C $pkgname describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd $pkgname
  install -Dm644 yt-dlg.desktop "$pkgdir/usr/share/applications/yt-dlg.desktop"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python setup.py build_trans install --root="$pkgdir" --optimize=1
}

