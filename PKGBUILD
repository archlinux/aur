# Maintainer: Felix Barz <skycoder42.de@gmx.de>
pkgname=qsshfs
pkgver=1.0.0
pkgrel=1
pkgdesc="A gui wrapper around sshfs, written in Qt"
arch=('i686' 'x86_64')
url="https://github.com/Skycoder42/qsshfs"
license=('BSD')
depends=('qt5-base' 'qt5-tools' 'sshfs')
makedepends=('git')
optdepends=("ksshaskpass: SSH_ASKPASS is required. This is one possible implementation for it.")
source=("$pkgname-$pkgver::git+https://github.com/Skycoder42/qsshfs.git#tag=$pkgver")
md5sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"
  git config submodule.QPathEdit.url "https://github.com/Skycoder42/QPathEdit.git"
  git config submodule.QtUtils.url "https://github.com/Skycoder42/QtUtils.git"
  git submodule update --init --recursive

  qmake
  make qmake_all
  make
}

package() {
  cd "$pkgname-$pkgver"
  
  make INSTALL_ROOT="$pkgdir" install  
  install -D -m644 ${pkgname}_32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/$pkgname.png"
  install -D -m644 ${pkgname}_16.png "$pkgdir/usr/share/icons/hicolor/16x16/apps/$pkgname.png"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
