# Maintainer: PRESFIL <echo cHJlc2ZpbEBwcm90b25tYWlsLmNvbQo= | base64 -d>

pkgname=i2pd-qt-git
pkgver=2.41.0.r3.d733e15
pkgrel=1
pkgdesc="i2pd with Qt based GUI "
arch=('any')
url="https://i2pd.website/"
license=('custom: BSD3')
groups=('i2p')
depends=('qt5-base' 'boost-libs' 'miniupnpc' 'openssl' 'zlib')
makedepends=('git' 'boost' 'miniupnpc' 'openssl' 'zlib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('i2pd-qt::git+https://github.com/PurpleI2P/i2pd-qt.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"

  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
  cd "${srcdir}/${pkgname%-git}"
  git submodule init
  git submodule update --recursive
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  qmake
  make
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  make INSTALL_ROOT="${pkgdir}" install
  install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname%-git}/"
}
