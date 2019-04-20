# Maintainer: Shatur <genaloner@gmail.com>

# Use KDE API features (recommended for Plasma users)
PLASMA=false

pkgname=optimus-manager-qt
pkgver=1.1.2
pkgrel=1
pkgdesc="A Qt interface for Optimus Manager that allows to configure and switch GPUs on Optimus laptops using the tray menu"
arch=('x86_64')
url="https://github.com/Shatur95/optimus-manager-qt"
license=('GPL3')
depends=('qt5-base' 'optimus-manager>=0.8')
makedepends=('qt5-tools')
source=($pkgname.tar.gz::"https://github.com/Shatur95/optimus-manager-qt/archive/$pkgver.tar.gz"
        SingleApplication-submodule.tar.gz::"https://github.com/itay-grudev/SingleApplication/archive/3.0.14.tar.gz")
sha256sums=('3a98888c6401ca887923288cb353d34a18cf27683a432f6835361a835b564280'
            '898aa58cebceb07a3b9af65011c0eef23e9789f930a021037dd7e05d2910f318')

if [ ${PLASMA} == true ]; then
  depends+=('knotifications' 'kiconthemes')
fi

# Move submodules into the project
prepare() {
    mv SingleApplication-3.0.14/* "$pkgname-$pkgver/src/third-party/singleapplication"
}

build() {
    cd "$pkgname-$pkgver"
  
  if [ ${PLASMA} == true ]; then
    qmake "DEFINES += PLASMA"
  else
    qmake
  fi
  
  make
}

package() {
    cd "$pkgname-$pkgver"
    make INSTALL_ROOT="$pkgdir/" install
} 
