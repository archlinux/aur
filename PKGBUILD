# Maintainer: Jose Riha < jose 1711 gmail com >

DLAGENTS=('https::/usr/bin/curl -A "Mozilla/4.0" -fLC - -o %o %u')
pkgname=pycom-firmware-updater
pkgver=1.14.5
pkgrel=1
pkgdesc="Pycom firmware updater for WiPy and LoPy IOT boards"
url="https://www.pycom.io/"
license=('GPL-3')
arch=('any')
depends=('dialog' 'python2')
optdepends=('python2-qscintilla-qt4: gui'
            'python2-pyserial: gui'
	    'python2-setuptools: gui'
	    'python2-requests: gui')
source=('https://software.pycom.io/findupgrade?product=pycom-firmware-updater&type=all&platform=unix&redirect=true'
        'lopyupdate.sh'
	'lopyupdate.desktop')
md5sums=('5e1cbe55102b78ea8f419e23033858c1'
         '268d38fbb3f7d8ee962760abb6169505'
         '6af9152e7aa93baa74b59cbc0af2ba71')

prepare() {
  cd $srcdir
  find . -name '*py' -exec sed -i '1s%python%python2%' '{}' \;
}
 
package() {
  mkdir -p $pkgdir/usr/{share,bin}
  cd $srcdir
  cp -r pyupgrade $pkgdir/usr/share
  ln -s /usr/share/pyupgrade/update $pkgdir/usr/bin/pycom-firmware-update
  install -Dm755 $srcdir/lopyupdate.sh $pkgdir/usr/bin/lopyupdate.sh
  install -Dm644 lopyupdate.desktop "$pkgdir"/usr/share/applications/lopyupdate.desktop
}
