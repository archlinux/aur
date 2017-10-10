# Maintainer: Alex Tharp <toastercup@gmail.com>
# Original Maintainer: Muratcan Sisek <mail@muratcansimsek.com.tr>
pkgname=hiri
pkgver=1.2.3.0
pkgrel=1
pkgdesc="A cross-platform, Exchange-ready email client aiming to replace Outlook"
arch=('x86_64')
url="https://www.hiri.com/"
license=('custom')
provides=('hiri')
conflicts=('hiri')
depends=('python-pyqt5'
         'qt5-webkit'
         'python-pyenchant')
install=$pkgname.install
source=('https://feedback.hiri.com/dist/downloads/Hiri-'$arch'-'$pkgver'.tar.gz'
        'https://feedback.hiri.com/dist/downloads/license.txt'
        'hiri.desktop'
        'hiri.sh')
sha512sums=('3b080f78f74ffccaebfc6719b9f23ef542f4bc4ac0dba48c01f44697323600cb284c0774356f07cd9d61cd28127422eed5abc111e1e9f5422846aff3115cff26'
            'ae8274026cb1b68f9b3f4cb66348952e19e31d477602a3d6d529121010260727824d0a060303e10fa8c5661f0b336ceabb0b472ad1cb74835ff5d6f3d3d53636'
            'cc50dc92bd28bb3178a857b436d0958077b1f6ede643a65cd5d6b900dc05d6b73f04ea1fe76af6298841bffb08f8d4fd94796b9511feeeaf2f3de8a6e163304c'
            'cafbf1f327618cb1d8914babf9cc9c2013b5db27df2a463329f9d366952c5ee592e946e727f991c8f7f558bdf7e625b91e0e029fa193650c197c6c9c6a57676d')

build () {
  cd hiri_"$pkgver"
}

package() {
  install -d "$pkgdir"/opt
  cp -rup "hiri_$pkgver" "$pkgdir"/opt/$pkgname

  install -d "$pkgdir"/usr/bin
  ln -s /opt/$pkgname/hiri.sh  "$pkgdir"/usr/bin/hiri

  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop

  install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/hiri

  install -d "$pkgdir"/usr/share/icons/hicolor/128x128/apps
  ln -s /opt/$pkgname/hiri.png "$pkgdir"/usr/share/icons/hicolor/128x128/apps/$pkgname.png

  install -Dm644 license.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
