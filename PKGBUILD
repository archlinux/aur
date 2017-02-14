# Maintainer: Dikiy <dikiy_evrej[at]web[dot]de>
pkgname=streamripper-gui
pkgver=0.1.2
pkgrel=1
pkgdesc="Detects on the automatic way, wich URL clementine/rhythmbox/amarok/etc. are now playing and rip it"
url="http://skss.learnfree.eu/archives/3665"
arch=('any')
license=('GPL3')
depends=('python2' 'python2-gobject' 'pygtk' 'python2-dbus' 'streamripper')
makedepends=('bzr')
conflicts=()
replaces=()
backup=()
#install=''
source=('bzr+https://launchpad.net/streamripper-gui/trunk')
md5sums=('SKIP')

build() {
  cd "${srcdir}/trunk/src"
  patch < ../../../dir_select.patch
  cd ..
  make translations
#  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr
#  make
}

package() {
  cd "${srcdir}/trunk"
  mkdir -p "$pkgdir/usr/share/applications/"
  install -Dm644 "src/streamripper-gui.desktop" "$pkgdir/usr/share/applications/"
  mkdir -p "$pkgdir/usr/share/streamripper-gui"
  install -Dm755 "src/streamripper-gui.py" "$pkgdir/usr/share/streamripper-gui/"
  install -Dm755 "src/subprocess.py" "$pkgdir/usr/share/streamripper-gui/"
  install -Dm644 "src/streamripper-gui.glade" "$pkgdir/usr/share/streamripper-gui/"
  mkdir "$pkgdir/usr/bin"
  cat > streamripper-gui <<EOF
#!/bin/bash
cd /usr/share/streamripper-gui/
python2 ./streamripper-gui.py
EOF
  
  install -Dm755 "streamripper-gui" "$pkgdir/usr/bin"
  cp -R locale "$pkgdir/usr/share/"
}

# vim:set ts=2 sw=2 et:
