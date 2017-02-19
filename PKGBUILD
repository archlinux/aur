# Maintainer: Ali Ukani <ali.ukani@gmail.com>
pkgname=voltra
pkgver=2.2.0
pkgrel=1
pkgdesc='Voltra music player'
arch=('x86_64')
url='https://voltra.co'
license=('custom')
depends=('desktop-file-utils')
install=${pkgname}.install
provides=('voltra')
source=(
  'https://s3.amazonaws.com/download.voltra.co/Voltra.tar.gz'
  'voltra.desktop'
)
md5sums=('a639c1c28b3f2d4568acf84c4ad7b7e8'
         '6e717f224da771bea3670d2658843946')


pkgver() {
  grep -i "version" resources/app/package.json | cut -d ':' -f 2 | sed -e 's/[^0-9\.]//g'
}

package() {
  cd "${srcdir}"
  install -dm755 "${pkgdir}"/opt/voltra.co/voltra
  cp -r . "${pkgdir}"/opt/voltra.co/voltra
  install -dm755 "${pkgdir}"/usr/bin
  ln -s /opt/voltra.co/voltra/voltra "${pkgdir}"/usr/bin/voltra
  install -Dm644 "${srcdir}"/resources/app/static/icon.png "${pkgdir}"/usr/share/pixmaps/voltra.png

  install -dm755 "${pkgdir}"/usr/share
  ln -s /opt/voltra.co/voltra "${pkgdir}"/usr/share/voltra

  cd ..
  install -Dm644 voltra.desktop "${pkgdir}"/usr/share/applications/voltra.desktop
}
