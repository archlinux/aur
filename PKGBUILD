# Maintainer: lxgr <lxgr@protonmail.com>

pkgbase='pokete-git'
pkgname='pokete-git'
pkgver=0.9.2.r53.g779b60fa
pkgrel=2
pkgdesc="A terminal based Pokemon like game"
arch=(any)
url="https://github.com/lxgr-linux/pokete"
license=('GPL-3.0-only')
provides=('pokete')
depends=('python' 'python-scrap_engine' 'alsa-lib')
makedepends=('git' 'go' 'python-yaml')
source=("$pkgbase"::'git+https://github.com/lxgr-linux/pokete')
md5sums=('SKIP')

pkgver() {
  cd "$pkgbase"
  git describe --tags --always | sed -r 's|release-||g;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/$pkgbase"
  ./util.py wiki
  cd ./playsound
  echo ":: Building sound module..."
  go build -ldflags "-s -w" -buildmode=c-shared -o ./libplaysound.so
}

package() {
  cd "${srcdir}/$pkgbase"
  ./util.py install "$pkgdir/usr"
}
