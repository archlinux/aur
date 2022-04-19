# Maintainer: willemw <willemw12@gmail.com>

pkgname=ffmpeg-normalize-git
pkgver=1.22.9.r1.gd375ad0
pkgrel=1
pkgdesc="Normalize loudness of audio and video files using FFmpeg"
arch=('any')
url="https://github.com/slhck/ffmpeg-normalize"
license=('MIT')
depends=('ffmpeg' 'python-ffmpeg-progress-yield')
checkdepends=('python-pytest')
makedepends=('git' 'python-setuptools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $pkgname
  python setup.py build
}

check() {
  cd $pkgname
  python test/test.py
}

package() {
  cd $pkgname
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
