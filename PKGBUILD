# Maintainer: carstene1ns <arch carsten-teibes de>

pkgname=zelda-classic
pkgver=2.5.0.24
pkgrel=1
pkgdesc="A tribute to Nintendo's The Legend of Zelda (NES)"
arch=('i686' 'x86_64')
url="http://zeldaclassic.com"
license=('custom: Freeware')
depends=('allegro4')
[ "$CARCH" = "x86_64" ] && depends=('lib32-allegro4')
optdepends=('gtk-engine-murrine: needed for the gtk2-launcher')
[ "$CARCH" = "x86_64" ] && optdepends=('lib32-gtk-engine-murrine: needed for the gtk2-launcher')
install=$pkgname.install
source=("http://www.shardstorm.com/zcmirror/zc-250-linux.tar.gz"
        "$pkgname.png"
        "$pkgname-zlaunch.png"
        "$pkgname-zquest.png"
        "$pkgname.sh"
        "$pkgname-zlaunch.sh"
        "$pkgname-zquest.sh"
        "$pkgname.desktop"
        "$pkgname-zlaunch.desktop"
        "$pkgname-zquest.desktop")
md5sums=('13fc7a5550d69cce15aaa5afa87a917d'
         '13b15546648bd9ac31e1a9a921078360'
         '64691761318b1087a55329f5a6997255'
         '7523e9eccb419ed73ce9389bb5efe962'
         'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')
sha256sums=('6fbd660403cc7f3292b3892ab08620ed02f3276e82274b35b210b09479783aa9'
            'bb4331ce9940c81edb95d3388f3e3cb459c1559df159d727b0302dd7dbbd82e1'
            'bfc007209c30f8b752ad102e2f9e6a4cd4fc447dc306c2712db4f34a8ffb3b7e'
            'e436cfa2303703037a800b298ad52f50af8e9e2d3e410e9298a6218761c9d088'
            'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

package() {
  cd "Zelda Classic"

  # create folders
  install -d $pkgdir/{opt/$pkgname/samplesoundset,usr/{bin,share/doc/$pkgname}}

  # install binaries
  install -m755 {romview,zelda,zlaunch,zquest}-l $pkgdir/opt/$pkgname

  # install data files
  install -m644 samplesoundset/patches.dat $pkgdir/opt/$pkgname/samplesoundset
  install -m644 *.{qst,dat,nsf} $pkgdir/opt/$pkgname

  # install doc files
  install -m644 *.{txt,zh} $pkgdir/usr/share/doc/$pkgname

  # install launchers
  install -m755 ../$pkgname.sh $pkgdir/usr/bin/$pkgname
  install -m755 ../$pkgname-zlaunch.sh $pkgdir/usr/bin/$pkgname-zlaunch
  install -m755 ../$pkgname-zquest.sh $pkgdir/usr/bin/$pkgname-zquest

  # install icon and desktop files
  for i in zelda-classic{,-zlaunch,-zquest}; do
    install -Dm644 ../$i.png $pkgdir/usr/share/pixmaps/$i.png
    install -Dm644 ../$i.desktop $pkgdir/usr/share/applications/$i.desktop
  done

  # install soundset licence
  install -Dm644 samplesoundset/COPYRIGHT $pkgdir/usr/share/licenses/zelda-classic/soundset
}
