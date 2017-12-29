# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>
pkgname=ssh-askpass-fullscreen
pkgver=1.1
pkgrel=3
pkgdesc="A small SSH Askpass replacement written with GTK2"
url="https://github.com/atj/ssh-askpass-fullscreen"
arch=('i686' 'x86_64')
license=('GPL')
provides=('x11-ssh-askpass')
conflicts=('x11-ssh-askpass')
depends=('gtk2' 'openssh')
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz
        ssh-askpass-fullscreen.sh)
md5sums=('fec8e50adcd997f85acdc9f8769ad6f9'
         '23a0f7bba208252cfef4e3b8206b31a3')

build() {
  cd "${pkgname}-${pkgver}/src"
  gcc -o ssh-askpass-fullscreen ssh-askpass-fullscreen.c $(pkg-config --libs --cflags gtk+-2.0 x11)
}

package() {
  install -D -m755 "${pkgname}-${pkgver}/src/ssh-askpass-fullscreen" "${pkgdir}/usr/lib/openssh/ssh-askpass-fullscreen"
  install -D -m755 "ssh-askpass-fullscreen.sh" "${pkgdir}/etc/profile.d/ssh-askpass-fullscreen.sh"
}
