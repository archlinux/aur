# Maintainer: willemw <willemw12@gmail.com>
# Contributor: rtfreedman  <rob<d0t>til<d0t>freedman< T>googlemail<d0t>com>

pkgname=exmplayer-git
pkgver=5.0.1.r38.g47f67c6
pkgrel=1
pkgdesc="MPlayer GUI front-end. Plays any media file. Video downloader, subtitle search, audio converter/extractor, media cutter, Gif animation generator"
arch=('x86_64')
url="http://exmplayer.sourceforge.net/"
license=('GPL')
depends=('ffmpeg' 'mplayer' 'qt5-base')    # kdelibs4support
optdepends=('youtube-dl: download video/audio')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=($pkgname::git+https://github.com/rupeshs/ExMplayer.git)
sha256sums=('SKIP')

pkgver() {
  git -C $pkgname describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  make -C $pkgname    # KDE_SUPPORT=1
}

package() {
  install -Dm644 $pkgname/debian/exmplayer.png -t "$pkgdir/usr/share/pixmaps"
  install -Dm644 $pkgname/exmplayer{,_enqueue}.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 $pkgname/linux_build/{fmts,sc_default.xml} -t "$pkgdir/etc/exmplayer"
  install -Dm755 $pkgname/src/exmplayer -t "$pkgdir/usr/bin"
}

