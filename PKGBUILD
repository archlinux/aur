# Maintainer: M0Rf30

pkgname='pyload-unstable-git'
pkgver=3074.90e8d1e
pkgrel=1
pkgdesc="Downloadtool for One-Click-Hoster written in python. Latest stable branch"
url="https://github.com/pyload/pyload"
license=('GPL')
arch=('any')
provides=('pyload')
conflicts=('pyload' 'pyload-hg' 'pyload-git')
backup=('var/lib/pyload/pyload.conf')
depends=('python2' 'python2-crypto' 'python2-pycurl' 'tesseract' 
         'python2-imaging' 'python2-jinja' 'python2-beaker' 'python2-pyopenssl')
optdepends=('python2-flup: for additional webservers'
	  'python2-notify: Notifications for GUI'
	  'js: ClickNLoad')
makedepends=('git')
install='pyload-unstable-git.install'

source=('pyload::git+https://github.com/pyload/pyload.git#branch=master'
	 pyload.service
	 pyload.conf
	 )

pkgver() {
  cd $startdir/pyload
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
  cd $srcdir
  sed -i 's_#!/usr/bin/env python$_#!/usr/bin/env python2_' pyload/pyload*.py
  
  install -d ${pkgdir}/opt/pyload
  cp -r pyload/* ${pkgdir}/opt/pyload
  install -d ${pkgdir}/usr/bin
  ln -s /opt/pyload/pyload.py ${pkgdir}/usr/bin/pyload
  ln -s /opt/pyload/pyloadcli.py ${pkgdir}/usr/bin/pyloadcli
 # Create PyLoad service
  install -Dm 644 ${srcdir}/pyload.service ${pkgdir}/usr/lib/systemd/system/pyload.service
  install -Dm 644 ${srcdir}/pyload.conf ${pkgdir}/var/lib/pyload/pyload.conf
}

md5sums=('SKIP'
         'd34a58f919ecf5e53da1c8986e62a1fe'
         '32b00d50be868c165930c592b99730a9')
