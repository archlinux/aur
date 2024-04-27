# Maintainer: RiverOnVenus <error@zhui.dev>
pkgname=matrix-webcam-git
pkgver=0.4.2.r0.g7cbc54c
pkgrel=1
pkgdesc="Take your video conference from within the matrix"
arch=('any')
url="https://github.com/joschuck/matrix-webcam"
license=('MIT')
depends=(
    'python'
    'python-numpy'
    'python-opencv'
    'python-mediapipe-bin'
    )
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
provides=('matrix-webcam')
conflicts=('matrix-webcam')
source=("$pkgname"::"git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare(){
  cd $pkgname
  git clean -dfx
}

build() {
    cd $pkgname
    python -m build --wheel --no-isolation
}

package() {
    cd $pkgname
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
