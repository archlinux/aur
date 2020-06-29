# Maintainer: Jose Riha < jose 1711 gmail com >

DLAGENTS=('https::/usr/bin/curl -A "Mozilla/4.0" -fLC - -o %o %u')
pkgname=pycom-firmware-updater
pkgver=1.16.3
pkgrel=1
pkgdesc="Pycom firmware updater for WiPy and LoPy IOT boards"
url="https://www.pycom.io/"
license=('GPL-3')
arch=('x86_64' 'i686')
depends=('dialog' 'python2')
optdepends=('python2-qscintilla-qt4: gui'
            'python2-pyserial: gui'
	    'python2-setuptools: gui'
	    'python2-requests: gui')
source_x86_64=("https://software.pycom.io/downloads/pycom_firmware_update_${pkgver}-amd64.tar.gz"
    	       'pycom-fwtool.desktop')
source_i686=("https://software.pycom.io/downloads/pycom_firmware_update_${pkgver}-i386.tar.gz"
             'pycom-fwtool.desktop')

md5sums_x86_64=('f962b59d8d94c290cc9535676bcf6680'
                'b9adb203ada3eb0ba6f1aaa0b74d609a')
md5sums_i686=('9df5338090308645b0cc1d9c8aee71c9'
              'b9adb203ada3eb0ba6f1aaa0b74d609a')


prepare() {
  cd $srcdir
  find . -name '*py' -exec sed -i '1s%python%python2%' '{}' \;
}
 
package() {
  mkdir -p $pkgdir/usr/{share/pyupgrade,bin}
  cd $srcdir/pyupgrade
  cp -r * $pkgdir/usr/share/pyupgrade
  ln -s /usr/share/pyupgrade/pycom-fwtool $pkgdir/usr/bin/pycom-fwtool
  ln -s /usr/share/pyupgrade/pycom-fwtool-cli $pkgdir/usr/bin/pycom-fwtool-cli
  ln -s /usr/share/pyupgrade/pycom-update $pkgdir/usr/bin/pycom-update
  install -Dm644 "${srcdir}/pycom-fwtool.desktop" "${pkgdir}"/usr/share/applications/pycom-fwtool.desktop
  install -Dm644 "${srcdir}/pyupgrade/res/py.png" "${pkgdir}/usr/share/pixmaps/pycom-fwtool.png"
}
