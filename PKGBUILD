# Maintainer: ParticleG <particle_g@outlook.com>

pkgname=uuyc
pkgver=4.33.0.8907
pkgrel=3
pkgdesc='NetEase UU Remote client configured for Wine'
arch=('x86_64')
url='https://uuyc.163.com/'
license=('LicenseRef-UU-Remote-EULA')
depends=('wine>=11.1' 'hicolor-icon-theme' 'procps-ng' 'util-linux')
makedepends=('7zip')
optdepends=('libnotify: desktop notifications during first-run setup')
options=('!strip' '!debug')
source=(
  "uuyc-${pkgver}.exe::https://a56.gdl.netease.com/UURemote_Setup_${pkgver}_0715193023_gwqd.exe"
  'uuyc'
  'uuyc.desktop'
  'UU-Remote-EULA.html::https://uuyc.163.com/contact/20240402/40294_1146065.html'
)
noextract=("uuyc-${pkgver}.exe")
sha256sums=(
  '5e3cfe8cfdc6552c1fc26f1ad2c94df133ca20dc3c45c23155358c32ac9bf53e'
  '6bc2df340099809a8b5bd4e187252509ef94cb575f3865d805c98c4684aaa8d3'
  '03c7d6d57d291dc2d5cf6d7af46ce606b1d5f488f819363af0158c2783376397'
  '3a2b28509a7c54bb701ae877af8312f2c366388c198427f483cf791c6eae0b65'
)

prepare() {
  rm -rf "$srcdir/uuyc-icon"
  7z x -y -o"$srcdir/uuyc-icon" \
    "$srcdir/uuyc-${pkgver}.exe" '.rsrc/ICON/6'
}

package() {
  install -Dm755 "$srcdir/uuyc" "$pkgdir/usr/bin/uuyc"
  install -Dm644 "$srcdir/uuyc.desktop" \
    "$pkgdir/usr/share/applications/uuyc.desktop"
  install -Dm644 "$srcdir/uuyc-${pkgver}.exe" \
    "$pkgdir/usr/share/uuyc/uuyc-installer.exe"
  install -Dm644 "$srcdir/uuyc-icon/.rsrc/ICON/6" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/uuyc.png"
  install -Dm644 "$srcdir/UU-Remote-EULA.html" \
    "$pkgdir/usr/share/licenses/$pkgname/UU-Remote-EULA.html"

  printf '%s\n' "$pkgver" >"$pkgdir/usr/share/uuyc/upstream-version"
  printf '%s-%s\n' "$pkgver" "$pkgrel" \
    >"$pkgdir/usr/share/uuyc/package-release"
}
