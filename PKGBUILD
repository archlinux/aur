# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=balatro
pkgver=1.0.1g
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
sha256sums=('5fbb7f4f79642e70f37b09669311e375e3c7fe1970a1a721b967e8502e27b5dd'
            'e75af1be33263f06503058631d5edb98899d5ece440fd3db76924b6d8cb900fb'
            '7d2361179935331ce548f18e897184a8a66454c28560e8897b9a04f9fe27e6a6'
            '4605993b18eb43800ca12ac7fe904c040f9ab39c5e5616dd02eb1ed4ed47deac')
b2sums=('449f424292e7502b60ec53f74883c658c72cf33d2dd20b4858d61372fab738c9c942a7966c6f12aa8f42fe2fb8d0b7440edadc6698aff4488c96d7badcef0a5c'
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
