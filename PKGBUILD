# Maintainer: Stefan Gehr <stefan@gehr.xyz>

pkgname=edvr-installer-bin
pkgver=0.20.1
pkgrel=1
pkgdesc='An unofficial patch for Elite Dangerous in VR'
arch=('any')
url='https://github.com/characterecho-sean/edvr-unofficial-patch'
license=('MIT')
depends=('python')
optdepends=('steam: Elite Dangerous runs through its Proton')
install=$pkgname.install
source=("https://github.com/characterecho-sean/edvr-unofficial-patch/releases/download/v$pkgver/edvr-installer-linux-$pkgver.zip"
        "LICENSE::https://raw.githubusercontent.com/characterecho-sean/edvr-unofficial-patch/v$pkgver/LICENSE")
sha256sums=('3a99cf38f79fa06cd4c23b091fa50a0845005c6370bceef4be12cf7540e42329'
            'e7d606f57bea13cad4819c81efc9e6ccb65802ffa7001f9618684cb5184ed3b5')

check() {
  python edvr-installer-linux.py --self-test
}

package() {
  install -Dm755 edvr-installer-linux.py "$pkgdir/usr/lib/edvr/edvr-installer-linux.py"
  install -Dm644 edvr-installer.exe      "$pkgdir/usr/lib/edvr/edvr-installer.exe"
  install -Dm644 README-linux.txt        "$pkgdir/usr/share/doc/$pkgname/README-linux.txt"
  install -Dm644 LICENSE                 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -d "$pkgdir/usr/bin"
  ln -s /usr/lib/edvr/edvr-installer-linux.py "$pkgdir/usr/bin/edvr-installer"
}
