# Maintainer: Bet4 <0xbet4@gmail.com>

pkgname=ropium
pkgver=3.2
pkgrel=1
pkgdesc='A tool to makes ROP-exploits easy'
arch=(x86_64)
url='https://github.com/Boyan-MILANOV/ropium'
depends=(python capstone ropgadget python-prompt_toolkit)
makedepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/Boyan-MILANOV/ropium/archive/v$pkgver.tar.gz")
sha256sums=('03650ab4b58e8bc11362d31c4162b7c212920d4936bb8b05ec2ea4cdde95da64')

build() {
  cd $pkgname-$pkgver
  make
}

check() {
  cd $pkgname-$pkgver
  make test
}

package() {
  cd $pkgname-$pkgver
  _pythonpath=`python -c "from sysconfig import get_path; print(get_path('platlib'))"`
  make DESTDIR="$pkgdir" PYTHONDIR="$pkgdir"/$_pythonpath  install
}
