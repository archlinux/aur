# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Frank Shin <frankshin82@gmail.com>

pkgname=mba6x_bl-dkms
_gitname=mba6x_bl
pkgver=latest
pkgrel=2
pkgdesc="Backlight for mba6x to fix post suspend/resume brightness."
url='https://github.com/patjak/mba6x_bl'
arch=('i686' 'x86_64')
license=('GPL2')
depends=('dkms' 'linux-headers')
install=$pkgname.install
provides=('mba6x_bl')
conflicts=('mba6x_bl')
source=("git+https://github.com/patjak/mba6x_bl.git"
        'mba6x_bl-dkms.conf')
md5sums=('SKIP'
         '1d04b891c7a387a845a1eac768749c6b')

backup=('etc/modules-load.d/mba6x_bl-dkms.conf')

pkgver() {
  cd "$srcdir/${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd "${srcdir}/"
  install -Dm 644 mba6x_bl-dkms.conf "${pkgdir}/etc/modules-load.d/mba6x_bl-dkms.conf"

  cd "${srcdir}/${_gitname}"
  for FILE in Makefile dkms.conf mba6x_bl.c; do
    install -Dm 644 $FILE "${pkgdir}/usr/src/mba6x_bl-$pkgver/$FILE"
  done
}
