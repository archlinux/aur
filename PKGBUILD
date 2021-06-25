# Maintainer: willemw <willemw12@gmail.com>
# Constributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=ucollage-git
pkgver=1.0.0.r0.g0393657
pkgrel=1
pkgdesc="Extensible command line image viewer inspired by vim"
arch=('any')
url="https://github.com/ckardaris/ucollage"
license=('GPL3')
depends=('bc' 'ueberzug')
makedepends=('git')
optdepends=('ffmpeg: video thumbnails' 'imagemagick: image rotation' 'xclip: clipboard pasting')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  make -C $pkgname PREFIX="$pkgdir/" install
  sed -i "s|$pkgdir||g" "$pkgdir/usr/bin/ucollage"
}

