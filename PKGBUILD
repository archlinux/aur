# Maintainer: M0Rf30

pkgname=kdeplasma-applets-qrcodeplasmoid-git
pkgver=10.9af2b9a
pkgrel=1
pkgdesc="A plasmoid to quickly export some selected text in QR Code"
arch=('i686' 'x86_64')
url="http://kde.org/"
license=('GPL')
depends=('kdebase-workspace' 'qrencode')
makedepends=('cmake' 'automoc4' 'git')
install=kdeplasma-applets-qrcodeplasmoid-git.install
source=("qrgenplasmoid::git+https://github.com/PVince81/qrgenplasmoid.git"
	patch)


build() {
  cd qrgenplasmoid
  patch -Np1 -i ../patch
  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd qrgenplasmoid
  make DESTDIR=${pkgdir} install
}

pkgver() {
  cd qrgenplasmoid
  echo $(git rev-list --count master).$(git rev-parse --short master)
}
md5sums=('SKIP'
	 '34928af1b21b65413109cd3808e509ef')
