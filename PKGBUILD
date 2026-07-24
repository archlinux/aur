# Maintainer: ParticleG <particle_g@outlook.com>

pkgname=uuyc-wine
pkgver=4.33.0.8907
pkgrel=4
pkgdesc='Wine compatibility package for NetEase UU Remote (网易UU远程)'
arch=('x86_64')
url='https://uuyc.163.com/'
license=('LicenseRef-UU-Remote-EULA')
depends=('wine>=11.1' 'hicolor-icon-theme' 'procps-ng' 'util-linux')
makedepends=('7zip')
optdepends=('libnotify: desktop notifications during first-run setup')
options=('!strip' '!debug')
install="$pkgname.install"
source=(
  "$pkgname-${pkgver}.exe::https://a56.gdl.netease.com/UURemote_Setup_${pkgver}_0715193023_gwqd.exe"
  'uuyc-wine'
  'uuyc-wine.desktop'
  'UU-Remote-EULA.html::https://uuyc.163.com/contact/20240402/40294_1146065.html'
)
noextract=("$pkgname-${pkgver}.exe")
sha256sums=(
  '5e3cfe8cfdc6552c1fc26f1ad2c94df133ca20dc3c45c23155358c32ac9bf53e'
  'fec66d1171e6bd3f9f5d71eb18a476a0b70f701bffd0ec4deb47e5265e192935'
  'a55bf7d10211616967119ff57f4fe82bebf0b0ad12b93f6eafd3f2f2928fa840'
  '3a2b28509a7c54bb701ae877af8312f2c366388c198427f483cf791c6eae0b65'
)

prepare() {
  rm -rf "$srcdir/$pkgname-icon"
  7z x -y -o"$srcdir/$pkgname-icon" \
    "$srcdir/$pkgname-${pkgver}.exe" '.rsrc/ICON/6'
}

package() {
  install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$srcdir/$pkgname-${pkgver}.exe" \
    "$pkgdir/usr/share/$pkgname/uuyc-wine-installer.exe"
  install -Dm644 "$srcdir/$pkgname-icon/.rsrc/ICON/6" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
  install -Dm644 "$srcdir/UU-Remote-EULA.html" \
    "$pkgdir/usr/share/licenses/$pkgname/UU-Remote-EULA.html"

  printf '%s\n' "$pkgver" >"$pkgdir/usr/share/$pkgname/upstream-version"
  printf '%s-%s\n' "$pkgver" "$pkgrel" \
    >"$pkgdir/usr/share/$pkgname/package-release"
}
