# Maintainer: pavbaranov <pavbaranov at gmail dot com>
# Maintainer: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Maintainer : Solomon Choina <shlomochoina@gmail.com>
pkgname=falkon-git
pkgver=3.1.0.72.g2098d69a
pkgrel=1
pkgdesc="Cross-platform Qt Web Browser"
arch=('i686' 'x86_64')
url="http://www.qupzilla.com"
license=('GPL')
depends=('qt5-webengine' 'pyside2' 'qt5-x11extras' 'qt5-svg' 'openssl>=1.1.0' 'purpose')
makedepends=('git' 'libgnome-keyring' 'qt5-tools' 'kwallet' 'shiboken2' 'pyside2-tools' 'kio' 'extra-cmake-modules' 'shiboken2' 'pyside2-tools'  'libgnome-keyring')

conflicts=('qupzilla' 'qupzilla-qt5' 'qupzilla-qt5-git' 'falkon')
optdepends=(
  'bash-completion: bash completion support'
  'kwallet: kf5 kwallet integration'
  'libgnome-keyring: gnome keyring integration'
  'pyside2: python plugins for falkon'
  'shiboken2: qml plugins for falkon'
  )
source=("git+https://anongit.kde.org/falkon.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  git describe --long --tags | sed 's/^v//;s/-/./g'
}

build() {
  mkdir build
  cd build
  cmake ../"${pkgname%-*}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
}
