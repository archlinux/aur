# Maintainer: Caesim404 <caesim404 at gmail dot com>
# Contributor: sumt <sumt at sci dot fi>
# Contributor: Jesse Jaara <gmail.com: jesse.jaara>

pkgname=yle-dl-git
pkgver=20250730.r48.g6893ae5
pkgrel=1
pkgdesc="Download video and audio from YLE Areena."
arch=("any")
url="http://aajanki.github.io/yle-dl/"
license=('GPL-3.0-or-later')
depends=('ffmpeg'
       'python-attrs'
       'python-configargparse'
       'python-lxml'
       'python-requests'
)
optdepends=('wget: for some rare streams')
makedepends=(
  'git'
  'python-setuptools'
)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=("$pkgname::git+https://github.com/aajanki/yle-dl.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^releases\///g'
}

prepare() {
  cd "$pkgname"
  git clean -dfx
}

build() {
  cd "$pkgname"
  python setup.py build
}

package() {
  cd "$pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
