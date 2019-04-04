# Maintainer : Yamashita Ren <lemaitre dot lotus at gmail.com>

pkgname=sushi-shifter-git
pkgver=0.5.1.r3.g908c0ff
pkgrel=1
pkgdesc="Automatic shifter for SRT and ASS subtitle based on audio streams."
arch=('i686' 'x86_64')
url="https://github.com/tp7/Sushi"
license=('custom')
depends=('python2' 'python2-numpy' 'opencv2')
optdepends=('ffmpeg: if demuxing is used' 
            'mkvtoolnix-cli: faster timecodes extraction when demuxing')
makedepends=('git')
source=("$pkgname"::"git+https://github.com/tp7/Sushi.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$pkgname"
  mkdir -p "$pkgdir/usr/local/lib/sushi-shifter"
  mkdir "$pkgdir/usr/local/bin"
  cp chapters.py common.py demux.py keyframes.py subs.py wav.py sushi.py "$pkgdir/usr/local/lib/sushi-shifter/"
  ln -s "/usr/local/lib/sushi-shifter/sushi.py" "$pkgdir/usr/local/bin/sushi-shifter"
  install -D -m644 LICENSE "$pkgdir/usr/local/share/licenses/sushi-shifter/LICENSE"
}
