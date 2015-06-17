# Maintainer: M0Rf30

pkgname='pyload-git'
pkgver=2621.76e7c4b
pkgrel=1
pkgdesc="Downloadtool for One-Click-Hoster written in python. Latest stable branch"
url="https://github.com/pyload/pyload"
license=('GPL')
arch=('any')
provides=('pyload')
conflicts=('pyload' 'pyload-hg')
backup=('var/lib/pyload/pyload.conf')
depends=('python2' 'python2-crypto' 'python2-pycurl' 'tesseract' 
         'python2-pillow' 'python2-jinja' 'python2-beaker' 'python2-pyopenssl')
optdepends=('python2-pyqt4: Gui'
          'python2-flup: for additional webservers'
	  'python2-notify: Notifications for GUI'
	  'js: ClickNLoad')
makedepends=('git')
install='pyload-git.install'

source=('pyload::git+https://github.com/pyload/pyload.git#branch=stable'
	 pyload.service
	 pyload.conf
	 pyload-gui.desktop
	 pyload.desktop
	 pyload-gui.png
	 pyload.svg)

pkgver() {
  cd $startdir/pyload
  echo $(git rev-list --count stable).$(git rev-parse --short stable)
}

package() {
  cd $srcdir
  sed -i 's_#!/usr/bin/env python$_#!/usr/bin/env python2_' pyload/pyLoad*.py
  
  install -d ${pkgdir}/opt/pyload
  cp -r pyload/* ${pkgdir}/opt/pyload
  install -d ${pkgdir}/usr/share/applications
  cp pyload.desktop ${pkgdir}/usr/share/applications
  cp pyload-gui.desktop ${pkgdir}/usr/share/applications
  install -d ${pkgdir}/usr/share/pixmaps
  cp pyload.svg ${pkgdir}/usr/share/pixmaps
  cp pyload-gui.png ${pkgdir}/usr/share/pixmaps
  install -d ${pkgdir}/usr/bin
  ln -s /opt/pyload/pyLoadCore.py ${pkgdir}/usr/bin/pyLoadCore
  ln -s /opt/pyload/pyLoadCli.py ${pkgdir}/usr/bin/pyLoadCli
  ln -s /opt/pyload/pyLoadGui.py ${pkgdir}/usr/bin/pyLoadGui
 # Create PyLoad service
  install -Dm 644 ${srcdir}/pyload.service ${pkgdir}/usr/lib/systemd/system/pyload.service
  install -Dm 644 ${srcdir}/pyload.conf ${pkgdir}/var/lib/pyload/pyload.conf
}

md5sums=('SKIP'
         'c9aec74442226efab711cc00bf4135b7'
         '32b00d50be868c165930c592b99730a9'
         'b96a4e5091463b3b7fd79208623f1a3a'
         'c67462993d27d5884677dd6e8a8a17d2'
         '73fcec930d25a49e1b99576069d88bd5'
         '649d5af94101655d37fe50e7b127d1b6')
