# Maintainer: ParticleG <particle_g@outlook.com>

pkgname=wegame-dwproton
pkgver=7.06.27.1446
pkgrel=1
pkgdesc='Unofficial DWProton integration for Tencent WeGame'
arch=('x86_64')
url='https://github.com/ParticleG/wegame-dwproton'
license=('LicenseRef-WeGame-EULA AND 0BSD')
depends=('dwproton' 'bash' 'coreutils' 'util-linux' 'hicolor-icon-theme')
makedepends=('7zip' 'imagemagick')
optdepends=('libnotify: desktop error notifications')
options=('!strip' '!debug')
install="$pkgname.install"

source=(
  "$pkgname-${pkgver}.exe::https://dldir1.qq.com/tgc/wegame/miniloader/WeGameMiniLoader.std.${pkgver}.exe"
  'wegame-dwproton'
  'wegame-dwproton.desktop'
  'wegame-dwproton.install'
  'LICENSE'
  'WeGame-EULA.txt'
)
noextract=("$pkgname-${pkgver}.exe")
sha256sums=(
  '0948beca682116a643629c93ff787d2602b599b4ca1c586d8b2c02a7f4ef6d26'
  'afc98f8951eec279e08ccb29dbd34641576c041a824975d762a7fadebd36a345'
  '0efdfb60c908ef0a75356d827e087e3afd4b66881ed895951bcc3e98360eac3a'
  'dab43cd44f7ec00cf752fdf9c5aeaad091bffb8fc609d7709ae99d6fdf79b7f7'
  'a0e144decd47d1b87623ae6224e5d4c4b3957768179a7c7933a93ec4f5b316c4'
  '0d41216d7887ecc574ba0a92de6fde21cde94a49c66cde77e80deacd50f1a9d9'
)

prepare() {
  rm -rf "$srcdir/$pkgname-icon"
  mkdir -p "$srcdir/$pkgname-icon"
  7z e -y -o"$srcdir/$pkgname-icon" \
    "$srcdir/$pkgname-${pkgver}.exe" icon.ico
  magick "$srcdir/$pkgname-icon/icon.ico[0]" \
    "$srcdir/$pkgname.png"
}

package() {
  install -Dm755 "$srcdir/$pkgname" \
    "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname-${pkgver}.exe" \
    "$pkgdir/usr/share/$pkgname/WeGameMiniLoader.exe"
  install -Dm644 "$srcdir/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$srcdir/$pkgname.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
  install -Dm644 "$srcdir/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/0BSD.txt"
  install -Dm644 "$srcdir/WeGame-EULA.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/WeGame-EULA.txt"
}
