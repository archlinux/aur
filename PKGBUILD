# Maintainer: Benjamin Landis <bmlandis2010@gmail.com>
# Contributor: Kent Fredric <kentfredric@gmail.com>
pkgname=bitmeter-os
pkgver=0.8.0
pkgrel=2
pkgdesc="A cross-platform bandwidth monitor. Based on official .deb package"
arch=('i686' 'x86_64')
url="http://codebox.org.uk/pages/bitmeteros"
license=('GPL')
depends=(
  'libpcap'
  'sqlite3'
)
install=bitmeteros.install
source=(
  "bitmeter.service"
  "bitmeter.target"
  "bitmeter-web.service"
  "bitmeteros_0.8.0-i386.deb::http://codebox.org.uk/downloads/bitmeteros/linux/080"
  "bitmeteros_0.8.0-amd64.deb::http://codebox.org.uk/downloads/bitmeteros/linux64/080"
)
noextract=(
  "bitmeteros_0.8.0-i386.deb"
  "bitmeteros_0.8.0-amd64.deb"
)
sha1sums=('5e41bbd9f22042bb26b89781b5ef630f97b09697'
          '4aee4f61881ec58b9c62a5c29a72b27aaaaca4f3'
          '1ec8caa847c9da724359af5e78bc70bfa208e883'
          'cb2429868ceca44a35c9c8cd7baf2b6d2dc168d8'
          '09b43f1edb4686617377be6a72e2d81a36699d84')

build() {
  cd "${srcdir}"
  _arch=$(uname -m)
  if [ "$_arch" == 'i686' ]
  then
      ar p bitmeteros_0.8.0-i386.deb data.tar.gz | tar vxz
  fi
  if [ "$_arch" == 'x86_64' ]
  then
      ar p bitmeteros_0.8.0-amd64.deb data.tar.gz | tar vxz
  fi
}

package() {
  cp -r "${srcdir}/etc" "${pkgdir}/etc"
  cp -r "${srcdir}/usr" "${pkgdir}/usr"
  cp -r "${srcdir}/var" "${pkgdir}/var"
  install -v -Dm0644 "${srcdir}/bitmeter.service"         "${pkgdir}/usr/lib/systemd/system/bitmeter.service"
  install -v -Dm0644 "${srcdir}/bitmeter.target"          "${pkgdir}/usr/lib/systemd/system/bitmeter.target"
  install -v -Dm0644 "${srcdir}/bitmeter-web.service"     "${pkgdir}/usr/lib/systemd/system/bitmeter-web.service"

}
