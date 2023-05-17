# Maintainer: f4iey <f4iey@f4iey.fr>	

pkgname=not1mm-git
pkgver=r557.86c9f0e
pkgrel=1
pkgdesc="Not1MM != N1MM, An amateur radio contest logger for Linux."
arch=('any')
license=('GPL3')
url="https://github.com/mbridak/not1mm"
makedepends=(git python-build python-installer python-wheel)
depends=(
python
python-pyqt5
python-requests
python-dicttoxml
python-xmltodict
python-psutil
python-sounddevice
python-soundfile
python-numpy
)
provides=(not1mm)
conflicts=(not1mm)
source=($pkgname::"git+$url.git")
sha256sums=('SKIP')

prepare(){
    git -C "$srcdir/$pkgname" clean -dfx
}

 pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $srcdir/$pkgname
  python -m build --wheel --no-isolation
}

package() {
  cd $srcdir/$pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
}
