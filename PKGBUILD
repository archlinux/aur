# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=balatro
pkgver=1.0.1o
pkgrel=2
pkgdesc='A deck-building roguelite where you must play poker hands and earn chips to defeat enemy blinds'
url='https://www.playbalatro.com'
license=('LicenseRef-Commercial')
arch=('any')
depends=('love')
makedepends=('zip' 'icoutils')
optdepends=(
  'lovely-injector: mods support'
)
source=("file://Balatro.exe"
        'balatro.sh'
        'balatro.desktop'
        'license.txt')
sha256sums=('0d75fe164accf3312734d4b37ac98788dd15f0b8e4f9bb8b7f90c4e59de93f47'
            'f3ad4eb4bb19198efc2790aac8029168acf6520c6758eb47dc1aadf576270707'
            '7d2361179935331ce548f18e897184a8a66454c28560e8897b9a04f9fe27e6a6'
            '4605993b18eb43800ca12ac7fe904c040f9ab39c5e5616dd02eb1ed4ed47deac')
b2sums=('acac428d4eb2c90c7c86345ee9e5db8113357815c55cd37c58a17ea588fca8d8924773ac9ec88372fd16cc43cd44112bd9451d2743d9a095bd67f4cd9d53eedf'
        'cf14a7f18073c8ae1b615595b561f1d87ee7ce88cbe1aae4d5ac279e72e2f11a7f4fc807d4fdf4e7a820059f752fb31e902970bd33bbff8d8d00726664cbba62'
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
