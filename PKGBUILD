# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=bigdatascript
pkgver=0.9999c
pkgrel=1
pkgdesc="Scirpting language for big data"
url="https://github.com/pcingola/BigDataScript"
arch=('any')
license=('Apache 2.0')
makedepends=('go' 'java-runtime>=8' 'apache-ant')
depends=('libgl' 'gstreamer0.10-good')
source=("https://github.com/pcingola/BigDataScript/archive/v${pkgver}.tar.gz")

options=(!strip docs libtool emptydirs !zipman staticlibs !upx)
md5sums=('0b84e7d9d293d4f86697081ecc9e3052')

#install=${pkgname}.install

prepare() {
  cd "${srcdir}/BigDataScript-${pkgver}"

  INSTALL_DIR="$pkgdir/opt/$pkgname"

  sed -i 's,BDS_HOME="$HOME/.bds",BDS_HOME="'$INSTALL_DIR'",g' scripts/install.sh
  sed -i '/echo "Changing dir" `dirname $0`/d' scripts/install.sh
  sed -i '/cd `dirname $0` &&  cd ../d' scripts/install.sh
  sed -i '/mkdir -p "$BDS_HOME" 2> \/dev\/null/d' scripts/install.sh
  sed -i 's,<jar destfile="${user.home}/.bds/,<jar destfile="'$INSTALL_DIR'/,g' build.xml
}

#build() {
#  cd "${srcdir}/BigDataScript-${pkgver}"
#}

package() {
  cd "${srcdir}/BigDataScript-${pkgver}"
  export GOPATH="$srcdir/go"

  mkdir -p "$pkgdir/opt/$pkgname"
  scripts/install.sh
  
  # install .desktop file
  install -m755 -D LICENSE.txt -t "${pkgdir}/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:

