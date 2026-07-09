# Maintainer: Nathaniel Chin <thegamingorangutans+aur at gmail.com>
# Contributor: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)

pkgname=plotbitrate-git
pkgver=1.2.0.1.r0.g2357cb5
pkgrel=1
pkgdesc="a script for plotting the bitrate of an audio or video stream over time"
arch=('any')
url="https://github.com/zeroepoch/plotbitrate"
license=('BSD-2-Clause')
depends=('python-matplotlib' 'python-pyqt6' 'ffmpeg')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools')
source=("git+https://github.com/zeroepoch/plotbitrate.git")
md5sums=('SKIP')
provides=('python-plotbitrate-git')
conflicts=('python-plotbitrate-git')

pkgver() {
  cd "plotbitrate"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  git -C "${srcdir}/plotbitrate" clean -dfx
}

build() {
  cd "plotbitrate"
  python -m build --wheel --no-isolation
}

package() {
  cd "plotbitrate"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
