# Maintainer: Anton Filimonov <anton.filimonov@gmail.com>

pkgname=klogg-bin-git
pkgver=23.06.0.1413
_subversion=0
pkgrel=1
pkgdesc="A multi-platform GUI application that helps browse and search through long and complex log files. It is designed with programmers and system administrators in mind and can be seen as a graphical, interactive combination of grep, less, and tail"
arch=('x86_64')
url='https://klogg.filimonov.dev'
license=('GPL3')
provides=('klogg')
conflicts=('klogg')
depends=('qt5-base' 'hicolor-icon-theme')

_klogg_version=`curl -L -s https://github.com/variar/klogg/releases/download/continuous-linux/klogg_version.txt`
_klogg_sha256=`curl -L -s https://github.com/variar/klogg/releases/download/continuous-linux/sha256_klogg_bin.txt | cut -c1-64 | head -n1`
source=("klogg_bin_${_klogg_version}.tar.gz::https://github.com/variar/klogg/releases/download/continuous-linux/klogg_bin.tar.gz")
sha256sums=("${_klogg_sha256}")

prepare() {
  wget -q --show-progress -O klogg_version.txt --backups=0 "https://github.com/variar/klogg/releases/download/continuous-linux/klogg_version.txt"
}

pkgver() {
  echo $_klogg_version
}

package() {
  tar xvf klogg_bin_${_klogg_version}.tar.gz -C "${pkgdir}/"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
}

