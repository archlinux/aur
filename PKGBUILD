# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: rabyte <rabyte__gmail>
# Contributor: Simone Sclavi 'Ito' <darkhado@gmail.com>

pkgname=lure
pkgver=1.1
pkgrel=3
pkgdesc="fantasy point-and-click adventure game with comedic elements (aka Lure of the Temptress) - multi language"
arch=('any')
url="http://www.revolution.co.uk/games/lure/"
license=('custom')
depends=('scummvm')
provides=('lure-de' 'lure-fr' 'lure-it' 'lure-es')  # this is a hack to support transition
conflicts=('lure-de' 'lure-fr' 'lure-it' 'lure-es') # from seperate language packages
install=lure.install
source=("http://downloads.sourceforge.net/scummvm/lure-$pkgver.zip"
        "http://downloads.sourceforge.net/scummvm/lure-de-$pkgver.zip"
        "http://downloads.sourceforge.net/scummvm/lure-fr-$pkgver.zip"
        "http://downloads.sourceforge.net/scummvm/lure-it-$pkgver.zip"
        "http://downloads.sourceforge.net/scummvm/lure-es-$pkgver.zip"
        "lure.sh")
sha256sums=('f3178245a1483da1168c3a11e70b65d33c389f1f5df63d4f3a356886c1890108'
            '5e83a6a8646629c55cfd84932b10231af2ff16d96e815ed0ce86564a0b3c186b'
            '2983149f9912a72761b1225e834a41d19aa565689b9027061a0220779694a1f8'
            '524270b2fb3f1caef621acf4379e3dbb69aed3c8ec1a98b38e94b290d3b046cf'
            '9306b9faad8c0a8189d3cbbfead511fc4d993655cc845cb8e15369baed2f7bb7'
            '2b063364f775bb1c8e4f571d5400da4581c77eff013fd8c6d400abcaec315150')

package() {
  # create folders
  install -d "$pkgdir"/usr/share/lure/{de,fr,it,es}

  # copy data files (fix case of files and link common file on the go)
  install -m644 lure/Disk{1,2,3,4}.vga "$pkgdir"/usr/share/lure/
  install -m644 lure-de/Disk{1,2,4}.vga "$pkgdir"/usr/share/lure/de/
  ln -s ../Disk3.vga "$pkgdir"/usr/share/lure/de/Disk3.vga
  for _l in es fr it; do
    for _d in 1 2 4; do
      install -m644 lure-$_l/DISK$_d.VGA "$pkgdir"/usr/share/lure/$_l/Disk$_d.vga
    done
    ln -s ../Disk3.vga "$pkgdir"/usr/share/lure/$_l/Disk3.vga
  done

  # doc
  install -Dm644 lure/PROTECT.PDF "$pkgdir"/usr/share/doc/lure/Protection.pdf
  install -m644 lure/README "$pkgdir"/usr/share/doc/lure
  install -m644 lure/Manual.pdf "$pkgdir"/usr/share/doc/lure
  for _l in de es fr it; do
    install -m644 lure-$_l/Manual.pdf "$pkgdir"/usr/share/doc/lure/Manual-$_l.pdf
  done

  # license
  install -Dm644 lure/LICENSE.txt "$pkgdir"/usr/share/licenses/lure/LICENSE

  # launchers
  install -Dm755 lure.sh "$pkgdir"/usr/bin/lure
  for _l in de es fr it; do
    ln -s lure "$pkgdir"/usr/bin/lure-$_l
  done
}
