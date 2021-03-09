# Maintainer: willemw <willemw12@gmail.com>

pkgname=ffmpeg-normalize-git
pkgver=1.21.2.r8.gf3be1d1
pkgrel=1
pkgdesc="Normalize loudness of audio and video files using FFmpeg"
arch=('any')
url="https://github.com/slhck/ffmpeg-normalize"
license=('MIT')
depends=('ffmpeg' 'python-colorama' 'python-tqdm')
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
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
