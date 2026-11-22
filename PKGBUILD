# Maintainer: Stefan Gehr <stefan@gehr.xyz>

pkgname=ed-up-launcher-bin
pkgver=0.23.0
pkgrel=1
pkgdesc='Launcher for ED-UP (formerly EDVR), the unofficial patch for Elite Dangerous, running in its Proton/Wine prefix'
arch=('any')
url='https://github.com/characterecho-sean/ed-unofficial-patch'
license=('MIT')
depends=('python')
optdepends=('steam: Elite Dangerous runs through its Proton')
install=$pkgname.install
replaces=('ed-up-installer-bin' 'edvr-installer-bin')
source=("https://github.com/characterecho-sean/ed-unofficial-patch/releases/download/v$pkgver/ed-up-launcher-linux-$pkgver.zip"
        "LICENSE::https://raw.githubusercontent.com/characterecho-sean/ed-unofficial-patch/v$pkgver/LICENSE"
        "ed-up-launcher-wrapper.sh"
        "ed-up-launcher.desktop")
sha256sums=('4cdabc688ac23aa3a8a5895d5a56e7d7fa467eb6461106de46267744012b312a'
            'e7d606f57bea13cad4819c81efc9e6ccb65802ffa7001f9618684cb5184ed3b5'
            'a666e97a1cb77c53054c14f0a6ccbd72a8db5691e74e0d9f5f497ad1335438e0'
            '7f72a299b7fbe93e2b560f9f2b1a19be942b3aadc804064654754af29dc8d593')

check() {
  python ed-up-launcher-linux.py --self-test
}

package() {
  # Upstream's ed-up-launcher.sh locates the Python wrapper beside itself,
  # and the wrapper locates epic_library.py and the .exe the same way,
  # so these four files must stay together.
  install -Dm755 ed-up-launcher.sh       "$pkgdir/usr/lib/ed-up/ed-up-launcher.sh"
  install -Dm755 ed-up-launcher-linux.py "$pkgdir/usr/lib/ed-up/ed-up-launcher-linux.py"
  install -Dm644 epic_library.py         "$pkgdir/usr/lib/ed-up/epic_library.py"
  install -Dm644 ed-up-launcher.exe      "$pkgdir/usr/lib/ed-up/ed-up-launcher.exe"

  install -Dm755 ed-up-launcher-wrapper.sh "$pkgdir/usr/bin/ed-up-launcher"
  install -Dm644 ed-up-launcher.desktop    "$pkgdir/usr/share/applications/ed-up-launcher.desktop"
  install -Dm644 README-launcher-linux.txt "$pkgdir/usr/share/doc/$pkgname/README-launcher-linux.txt"
  install -Dm644 LICENSE                   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
