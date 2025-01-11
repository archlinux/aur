# Maintainer: MonadicSpell <root at zyy dot lol>
pkgname=vala-rofi-polkit
pkgver=1.0.0
pkgrel=1
pkgdesc="A tool crafted to employ Rofi, or any other program executable via a Bash script, as the authentication user interface for Polkit."
arch=('x86_64')
url="https://github.com/MonadicSpell/vala-rofi-polkit"
license=('MIT')
depends=('polkit')
optdepends=('bash')
makedepends=('git' 'meson' 'ninja' 'vala')
source=("${pkgname}-${pkgver}::git+${url}#tag=v${pkgver}")
options=('!debug')
sha256sums=('SKIP')

build() {
  cd "${pkgname}-${pkgver}"
  meson setup builddir --buildtype=release
  meson compile -C builddir
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 builddir/vala-polkit-forwarder "$pkgdir/usr/bin/vala-polkit-forwarder"
  install -Dm755 vala-polkit-rofi               "$pkgdir/usr/bin/vala-polkit-rofi"
  install -Dm644 LICENSE                        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
