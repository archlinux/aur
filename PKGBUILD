# Maintainer: Bet4 <0xbet4@gmail.com>

_pkgname=ropium
pkgname=${_pkgname}-git
pkgver=v3.1.r7.g41085d3
pkgrel=1
pkgdesc='A tool to makes ROP-exploits easy'
arch=(x86_64)
url='https://github.com/Boyan-MILANOV/ropium'
depends=(python capstone ropgadget python-prompt_toolkit)
makedepends=(git)
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $pkgname
  make
}

check() {
  cd $pkgname
  make test
}

package() {
  cd $pkgname
  _pythonpath=`python -c "from sysconfig import get_path; print(get_path('platlib'))"`
  make DESTDIR="$pkgdir" PYTHONDIR="$pkgdir"/$_pythonpath  install
}
