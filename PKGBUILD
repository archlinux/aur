# Maintainer: matoro <matoro@airmail.cc>
# Contributor: Lari Tikkanen <lartza@wippies.com>

pkgname=python2-youtube-dl-git
_gitname="youtube-dl"
pkgver=2017.07.09.r0.65c416dda
pkgrel=1
pkgdesc="A small command-line program to download videos from YouTube.com and a few more sites (git version)"
arch=('any')
url="https://github.com/rg3/youtube-dl"
license=('custom')
depends=('python2')
makedepends=('git' 'python2-setuptools' 'pandoc')
optdepends=('ffmpeg: for video post-processing'
            'rtmpdump: for rtmp streams support')
provides=("python2-youtube-dl")
conflicts=("python2-youtube-dl")
source=('git+https://github.com/rg3/youtube-dl.git')
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$_gitname
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd $srcdir/$_gitname
  make pypi-files
}

package() {
  cd $srcdir/$_gitname
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  rm -r "${pkgdir}/usr/etc"
  rm -r "${pkgdir}/usr/bin"
  rm -r "${pkgdir}/usr/share/man"
  rm -r "${pkgdir}/usr/share/doc"
}
