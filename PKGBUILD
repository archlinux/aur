# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Paulo Matias <matiasΘarchlinux-br·org>

pkgname=qirssi
pkgver=20090305
pkgrel=2
pkgdesc="A Qt trayicon and notifier for irssi"
url="http://code.google.com/p/qirssi"
arch=('i686' 'x86_64')
license=('BSD')
depends=('qt4' 'irssi' 'screen')
source=(http://qirssi.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('96ff164721d6b293e37f0dffdcfa43f2')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  qmake-qt4 qirssi.pro
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  install -Dsm755 qirssi "${pkgdir}"/usr/bin/qirssi
  install -Dm644 qirssi.pl "${pkgdir}"/usr/share/irssi/scripts/qirssi.pl

#license
  install -d "${pkgdir}"/usr/share/licenses/${pkgname}
  sed '1,14p;d' qirssi.pl > "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}