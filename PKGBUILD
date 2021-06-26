# Maintainer: willemw <willemw12@gmail.com>
# Contributor: B4SH-B00STER

pkgname=youtube-dl-gui-git
pkgver=0.4.r81.gc5c18e5
pkgrel=2
pkgdesc="Cross platform front-end GUI of the popular youtube-dl written in wxPython"
arch=('any')
url="https://github.com/MrS0m30n3/youtube-dl-gui"
license=('custom:UNLICENSE')
#depends=('python2-twodict' 'python2-wxpython3')
depends=('python2-twodict-git' 'python2-wxpython3')
optdepends=('ffmpeg: convert video files to audio-only files'
            'youtube-dl: alternative to the youtube-dl program downloaded by youtube-dl-gui')
makedepends=('git')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=($pkgname::git+$url.git
        youtube-dl-gui.desktop)
sha256sums=('SKIP'
            '1f687872e8105394e8b41ab99f3923e87b1cb6c041602147d7847bc4b8f26e8d')

pkgver() {
  git -C $pkgname describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  install -Dm644 youtube-dl-gui.desktop -t "$pkgdir/usr/share/applications"

  cd $pkgname
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  python2 setup.py install --root="$pkgdir" --optimize=1
}

