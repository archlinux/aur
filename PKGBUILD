# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=zelda-classic
pkgver=2.50.1.28
pkgrel=1
pkgdesc="A tribute to Nintendo's The Legend of Zelda (NES)"
arch=('i686' 'x86_64')
url="http://zeldaclassic.com"
license=('custom: Freeware')
depends_i686=('libxpm' 'libxxf86vm' 'libxcursor' 'alsa-lib')
depends_x86_64=('lib32-libxpm' 'lib32-libxxf86vm' 'lib32-libxcursor' 'lib32-alsa-lib')
optdepends_i686=('gtk-engine-murrine: needed for the gtk2-launcher')
optdepends_x86_64=('lib32-gtk-engine-murrine: needed for the gtk2-launcher')
install=$pkgname.install
source=("http://www.shardstorm.com/zcmirror/zc-2-50-1-linux.tar.gz"
        "$pkgname.png"
        "$pkgname-zlaunch.png"
        "$pkgname-zquest.png"
        "$pkgname.desktop"
        "$pkgname-zlaunch.desktop"
        "$pkgname-zquest.desktop"
        "$pkgname.sh")
sha256sums=('1d269e537b83f8b8c40c25ce53b36a57e6243bf0fafd2f5614d0fd1cf9d7a3af'
            'bb4331ce9940c81edb95d3388f3e3cb459c1559df159d727b0302dd7dbbd82e1'
            'bfc007209c30f8b752ad102e2f9e6a4cd4fc447dc306c2712db4f34a8ffb3b7e'
            'e436cfa2303703037a800b298ad52f50af8e9e2d3e410e9298a6218761c9d088'
            '23c4158bea70740a3685217dcb0e8cc1225425af437cfccf6d12c83de4743c8c'
            '44e1c4f0a0bed46ce40cb7659863c797b47d1afcef99c86cc329d10898511c2f'
            '72bc054a698e36b9a23e3907ac9112aab78b0424c71ba0c9a657cbe78886572c'
            'ee7b5cac453f4d2702cd2e136df85de26cc22ef608329ff55d062760f3f616fb')

package() {
  cd "Zelda Classic"

  # create folders
  install -d "$pkgdir"/{opt/$pkgname/samplesoundset,usr/{bin,share/doc/$pkgname}}

  # install binaries
  install -m755 {romview,zelda,zlaunch,zquest}-l "$pkgdir"/opt/$pkgname

  # install data files
  install -m644 samplesoundset/patches.dat "$pkgdir"/opt/$pkgname/samplesoundset
  install -m644 *.{qst,dat,nsf} "$pkgdir"/opt/$pkgname

  # install doc files
  install -m644 *.{txt,zh} "$pkgdir"/usr/share/doc/$pkgname

  # install launchers
  install -m755 ../$pkgname.sh "$pkgdir"/usr/bin/$pkgname
  ln -s $pkgname "$pkgdir"/usr/bin/$pkgname-zlaunch
  ln -s $pkgname "$pkgdir"/usr/bin/$pkgname-zquest

  # install icon and desktop files
  for i in zelda-classic{,-zlaunch,-zquest}; do
    install -Dm644 ../$i.png "$pkgdir"/usr/share/pixmaps/$i.png
    install -Dm644 ../$i.desktop "$pkgdir"/usr/share/applications/$i.desktop
  done

  # install soundset licence
  install -Dm644 samplesoundset/COPYRIGHT "$pkgdir"/usr/share/licenses/$pkgname/soundset
}
