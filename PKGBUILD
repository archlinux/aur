# Maintainer: Rellieberman <name AT gmail DOT com>

#this package will install the python2 script server needed to run the Blink mouse application
#in order to run the script run 'bluetooth_server.py' from terminal. note: may need to be run as root.
pkgname=blink-server
pkgver=1.0
pkgrel=2
pkgdesc="The desktop-side server needed in order to run the Blink Android mouse application"
arch=('any')
url="https://github.com/drpain/blink-server"
license=('MIT')
depends=('python2'
         'python2-pybluez'
         'xdotool'
         'bluez')
_sha=35f63810d600d2363c0c5ee0d375996ac99fdfba
_zipname="$pkgname-$pkgver"
source=("file://start_compat_mode.conf"
        "$_zipname.zip::$url/archive/$_sha.zip")
sha256sums=('SKIP' 
            '606a81dc6cf6f67e9ffbde8008fb798a5edea6ae080a2c4993abcb98c857ece2')
prepare() {
    cd "${srcdir}/${pkgname}-${_sha}"
   sed -i 's/python/python2/' "bluetooth_server.py"
   touch core.pyc
}

package() {
    mkdir ${pkgdir}/usr
    mkdir ${pkgdir}/usr/bin
    mkdir ${pkgdir}/etc
    mkdir ${pkgdir}/etc/systemd
    mkdir ${pkgdir}/etc/systemd/system
    mkdir ${pkgdir}/etc/systemd/system/bluetooth.service.d
    
    
    install -D -m644 "start_compat_mode.conf" "${pkgdir}/etc/systemd/system/bluetooth.service.d/start_compat_mode.conf"
    
    cd "${srcdir}/${pkgname}-${_sha}"
    install -D -m755 "bluetooth_server.py" "${pkgdir}/usr/bin/bluetooth_server.py"
    install -D -m755 "core.py" "${pkgdir}/usr/bin/core.py"
    install -D -m755 "core.pyc" "${pkgdir}/usr/bin/core.pyc"
    
}
