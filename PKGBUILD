# Maintainer: Muratcan Sisek <mail@muratcansimsek.com.tr>
pkgname=hiri
pkgver=1.0.7.0
pkgrel=1
pkgdesc="An Exchange ready mail client aiming to replace Outlook (QT5)"
arch=('x86_64')
url="https://www.hiri.com/"
license=('custom')
depends=('python-pyqt5'
	 'qt5-webkit'
	 'python-pyenchant')
install=$pkgname.install
source=('https://feedback.hiri.com/downloads/Hiri-'$arch'-'$pkgver'.tar.gz'
	'hiri.desktop'
	'Hiri-EULA'
	'hiri.sh')
sha512sums=('4696b1fb777d66d66110b4612dc74f8491d9ebd868ae8c713cc04dd4ce05854a52349c32f8c22fec4578a8d6ac3e4243c1b75efba7a83812c4b66587a11e334b'
            '5afa589faa4d31419f74650d2d7735c430d236d5fe264b000154eeaeface527547db8816a45485e7d144a3151e8d5edc847fe2b5e2eb7f447ae91285064afb7d'
            'c1640c1a3430418a72cbaa169c790a18f0571613c1c4791f8c4c12289bbc10ca361bb322baa79a1b183411bc378f7e51ed235ef49f6ace0aab92367321444b81'
            'cafbf1f327618cb1d8914babf9cc9c2013b5db27df2a463329f9d366952c5ee592e946e727f991c8f7f558bdf7e625b91e0e029fa193650c197c6c9c6a57676d')

build () {
	cd hiri
	cp /usr/lib/python3.6/lib-dynload/_ssl.cpython-36m-x86_64-linux-gnu.so _ssl.cpython-36m-x86_64-linux-gnu.so

}
package() {
  install -d "$pkgdir"/opt
  cp -rup "hiri" "$pkgdir"/opt/$pkgname

  install -d "$pkgdir"/usr/bin
  ln -s /opt/$pkgname/hiri.sh  "$pkgdir"/usr/bin/hiri

  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop

  install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/hiri

  install -d "$pkgdir"/usr/share/icons/hicolor/128x128/apps
  ln -s /opt/$pkgname/hiri.png "$pkgdir"/usr/share/icons/hicolor/128x128/apps/$pkgname.png

  install -Dm644 Hiri-EULA "$pkgdir"/usr/share/licenses/$pkgname/EULA
   
}
