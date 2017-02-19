# Maintainer: Ali Ukani <ali.ukani@gmail.com>
pkgname=voltra
pkgver=2.3.2
pkgrel=1
pkgdesc='Voltra music player'
arch=('x86_64')
url='https://voltra.co'
license=('custom')
depends=('desktop-file-utils')
install=${pkgname}.install
provides=('voltra')
source=(
  'https://s3.amazonaws.com/download.voltra.co/Voltra.deb'
)
md5sums=('b6ae8c5c646b78b5158558c53ddbbbce')

prepare() {
  cd "${srcdir}"
  tar xzf control.tar.gz
}

pkgver() {
  grep -i "Version" "${srcdir}"/control | cut -d ' ' -f 2
}

package() {
  cd "${srcdir}"
  tar xJvf data.tar.xz
  cp -r usr opt "${pkgdir}"
  install -dm755 "${pkgdir}"/usr/bin
  ln -s /opt/Voltra/voltra "${pkgdir}"/usr/bin/voltra
}
