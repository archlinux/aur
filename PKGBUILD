# Maintainer: Julian Jacques Maurer <mail@julianjmaurer.de>
pkgname=hiri
pkgver=0.0.61.0
pkgrel=1
pkgdesc="An Exchange ready mail client aiming to replace Outlook"
arch=('x86_64')
url="https://www.hiri.com/product/"
license=('custom')
depends=('python-pyqt5'
	 'qt5-webkit'
	 'python-pyenchant')
install=$pkgname.install
source=('https://feedback.hiri.com/downloads/Hiri.tar.gz'
	'hiri.desktop'
	'Hiri-EULA'
	'hiri.sh')
sha512sums=('71c209bbcd2e80e401470256727f2d314686fb6a385526575e446d66171cdf2b0f38073b696897b739356543dff35b814cab41502a5816e873980981c92535a5'
            '5afa589faa4d31419f74650d2d7735c430d236d5fe264b000154eeaeface527547db8816a45485e7d144a3151e8d5edc847fe2b5e2eb7f447ae91285064afb7d'
            'c1640c1a3430418a72cbaa169c790a18f0571613c1c4791f8c4c12289bbc10ca361bb322baa79a1b183411bc378f7e51ed235ef49f6ace0aab92367321444b81'
            'cafbf1f327618cb1d8914babf9cc9c2013b5db27df2a463329f9d366952c5ee592e946e727f991c8f7f558bdf7e625b91e0e029fa193650c197c6c9c6a57676d')

build () {
	cd Hiri-x86_64-$pkgver
	cp /usr/lib64/python3.5/lib-dynload/_ssl.cpython-35m-x86_64-linux-gnu.so _ssl.cpython-34m-x86_64-linux-gnu.so

}
package() {
  install -d "$pkgdir"/opt
  cp -rup "Hiri-x86_64-$pkgver" "$pkgdir"/opt/$pkgname

  install -d "$pkgdir"/usr/bin
  ln -s /opt/$pkgname/hiri.sh  "$pkgdir"/usr/bin/hiri

  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop

  install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/hiri

  install -d "$pkgdir"/usr/share/icons/hicolor/128x128/apps
  ln -s /opt/$pkgname/hiri.png "$pkgdir"/usr/share/icons/hicolor/128x128/apps/$pkgname.png

  install -Dm644 Hiri-EULA "$pkgdir"/usr/share/licenses/$pkgname/EULA
   
}
