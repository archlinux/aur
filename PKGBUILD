# Maintainer: anon at sansorgan.es
_pkgname=kloak
pkgname=kloak-git
provides=('kloak')
pkgver=0.2
pkgrel=2
pkgdesc="anti keystroke deanonymization tool"
url=https://github.com/vmonaco/kloak
license=('BSD3')
arch=('i686' 'x86_64')
options=('strip')
source=("git+https://github.com/vmonaco/kloak")
md5sums=("SKIP")

build() {
  cd ${srcdir}/${_pkgname}
  make all
  sed -i '/^ConditionPathExists/d' lib/systemd/system/kloak.service
  sed -i 's|^ExecStart=.*|ExecStart=/usr/bin/kloak -v -d 100|g' lib/systemd/system/kloak.service 
}

package() {
  cd ${srcdir}/${_pkgname}
  install -d -m755 $pkgdir/usr/bin/
  install -m755 kloak $pkgdir/usr/bin/kloak
  install -m755 eventcap $pkgdir/usr/bin/eventcap
  install -d -m755 $pkgdir/usr/lib/systemd/system/
  install -m644 lib/systemd/system/kloak.service \
  $pkgdir/usr/lib/systemd/system/kloak.service
}
