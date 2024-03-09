# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=balatro
pkgver=1.0.0n
pkgrel=1
pkgdesc='A deck-building roguelite where you must play poker hands and earn chips to defeat enemy blinds'
url='https://www.playbalatro.com'
license=('LicenseRef-Commercial')
arch=('any')
depends=('love')
makedepends=('zip' 'icoutils')
source=("file://Balatro.exe"
        'balatro.sh'
        'balatro.desktop'
        'license.txt')
sha256sums=('44c831c88e96b60a237f41a88cbf851ecadc151c434dba0be8163a66364b506f'
            'e75af1be33263f06503058631d5edb98899d5ece440fd3db76924b6d8cb900fb'
            '7d2361179935331ce548f18e897184a8a66454c28560e8897b9a04f9fe27e6a6'
            '4605993b18eb43800ca12ac7fe904c040f9ab39c5e5616dd02eb1ed4ed47deac')
b2sums=('55ad1525ebeb4313d6e127fd6bdd7f6767e1df283716c90c6ed72ac050a6a97fd8fb38eb31e255f5d5e743a059af1e72d97e34cec0f08fdf119dc028db3fc558'
        'abf37ce4471142c572f2d96b38035bea76b4d2748e0a91408ed4a1786b0b5848c19c01e10090587637a08658d2a0ded8f70734acc567fca2fe59c91f8600d10e'
        'dc6ac93f66d94193b0cd20171ba2dd68975ada38323f6558808ab4fc73bac4baa6f5ff71354b2dcd6fc56d8344a35e1ad05645d3a4138534133066c9b8e01558'
        '5ef85fdf2cc614cd9128247bd4a7bb02ee35b8420c3ca237ef754f7297bf6b69620c66fd6ca07d536615ff5285b8b3448ad06e7f3b7bd0303eff3889ad8c1c54')

prepare() {
  wrestool -x -t14 -o . Balatro.exe
  icotool -x *.ico
}

package() {
  zip -r9 balatro.love *.lua *.jkr */

  install -Dm0755 -t "$pkgdir/usr/share/balatro" balatro.love
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" license.txt

  install -Dm0755 balatro.sh "$pkgdir/usr/bin/balatro"

  install -Dm0644 balatro.desktop "$pkgdir/usr/share/applications/balatro.desktop"
  install -Dm0644 'Balatro.exe_14_MAINICON_0_3_32x32x32.png' "$pkgdir/usr/share/pixmaps/balatro.png"
}
