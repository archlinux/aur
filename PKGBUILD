# Maintainer: Shatur <genaloner@gmail.com>

# Use KDE API for tray for additional feautures (this also add knotifier dependency, recommended for KDE users).
KDE=false

pkgname=optimus-manager-qt
pkgver=1.0.0
pkgrel=1
pkgdesc="A Qt interface for Optimus Manager that allows to configure and switch GPUs on Optimus laptops using the tray menu"
arch=('x86_64')
url="https://github.com/Shatur95/optimus-manager-qt"
license=('GPL3')
depends=('qt5-base' 'optimus-manager')
makedepends=('qt5-tools')
source=($pkgname.tar.gz::"https://github.com/Shatur95/optimus-manager-qt/archive/$pkgver.tar.gz"
        SingleApplication-submodule.tar.gz::"https://github.com/itay-grudev/SingleApplication/archive/3.0.14.tar.gz")
sha256sums=('45e8247ceb924a56371377e1ccdb5a89de0ed90a115c53326d27ecefbdca2646'
            '898aa58cebceb07a3b9af65011c0eef23e9789f930a021037dd7e05d2910f318')

if [ ${KDE} == true ]; then
  depends+=('knotifications')
fi

# Move submodules into the project
prepare() {
    mv SingleApplication-3.0.14/* "$pkgname-$pkgver/src/third-party/singleapplication"
}

build() {
    cd "$pkgname-$pkgver"
  
  if [ ${KDE} == true ]; then
    qmake "DEFINES += KDE"
  else
    qmake
  fi
  
  make
}

package() {
    cd "$pkgname-$pkgver"
    make INSTALL_ROOT="$pkgdir/" install
} 
