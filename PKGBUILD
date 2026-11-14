# Maintainer: Stefan Gehr <stefan@gehr.xyz>

pkgname=ed-up-installer-bin
pkgver=0.22.1
pkgrel=1
pkgdesc='ED Unofficial Patch (ED-UP, formerly EDVR): unofficial fixes and DLSS/FSR/XeSS upscaling for Elite Dangerous in VR and flat'
arch=('any')
url='https://github.com/characterecho-sean/ed-unofficial-patch'
license=('MIT')
depends=('python')
optdepends=('steam: Elite Dangerous runs through its Proton')
provides=('edvr-installer-bin')
conflicts=('edvr-installer-bin')
replaces=('edvr-installer-bin')
install=$pkgname.install
source=("https://github.com/characterecho-sean/ed-unofficial-patch/releases/download/v$pkgver/ed-up-installer-linux-$pkgver.zip"
        "LICENSE::https://raw.githubusercontent.com/characterecho-sean/ed-unofficial-patch/v$pkgver/LICENSE"
        "edvr-installer.sh"
        "ed-up-installer.desktop")
sha256sums=('128eda3a09cde71dada7fe53761e1f30c7a77805d0f523d27287eca70ad5d261'
            'e7d606f57bea13cad4819c81efc9e6ccb65802ffa7001f9618684cb5184ed3b5'
            '0dfe8de1588cc019e7ba3b4c4bcd17e28bdaa7dfcdc76d54223eb0df4624e5ab'
            'd23b609e18317273760a10693827228424bd101bf069754e9b2827dacdcfb6b4')

check() {
  python edvr-installer-linux.py --self-test
}

package() {
  install -Dm755 edvr-installer-linux.py "$pkgdir/usr/lib/edvr/edvr-installer-linux.py"
  install -Dm644 edvr-installer.exe      "$pkgdir/usr/lib/edvr/edvr-installer.exe"
  install -Dm644 README-linux.txt        "$pkgdir/usr/share/doc/$pkgname/README-linux.txt"
  install -Dm644 LICENSE                 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 edvr-installer.sh       "$pkgdir/usr/bin/edvr-installer"
  install -Dm644 ed-up-installer.desktop "$pkgdir/usr/share/applications/ed-up-installer.desktop"
}
