# Maintainer: yaroslav <proninyaroslav@mail.ru>
# Contributor: Carson Reynolds <carson@k2.t.u-tokyo.ac.jp>

pkgname=coriander
pkgver=2.0.2
pkgrel=5
pkgdesc="Coriander is a Graphical User Interface for controlling IEEE1394 (Firewire) cameras."
arch=('i686' 'x86_64')
url="http://damien.douxchamps.net/ieee1394/coriander/"
license=('GPL 3.0')
depends=('sdl' 'libgnomeui' 'libraw1394' 'libdc1394' 'libxv')
source=("http://downloads.sourceforge.net/coriander/${pkgname}-${pkgver}.tar.gz"
        "coriander.desktop")
md5sums=('431d98fb013217681f97ade168201fb8'
         'd71f1c8bca0b2696e9951a8fd32952b8')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure
  make
}
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir/" install
  if [ ! -f $HOME/.local/share/applications/${pkgname}.desktop ]
  then
      cp ${srcdir}/${pkgname}.desktop $HOME/.local/share/applications
  fi
}