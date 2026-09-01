# Maintainer: ParticleG <particle_g@outlook.com>

pkgname=wegame-dwproton
pkgver=7.06.27.1446
pkgrel=2
pkgdesc='Unofficial DWProton integration for Tencent WeGame'
arch=('x86_64')
url='https://github.com/ParticleG/wegame-dwproton'
license=('LicenseRef-WeGame-EULA AND 0BSD')
depends=('bash' 'coreutils' 'util-linux' 'hicolor-icon-theme')
makedepends=('7zip' 'imagemagick')
optdepends=(
  'dwproton: system-wide DWProton runtime; not needed for ProtonUp-Qt installations'
  'libnotify: desktop error notifications'
)
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
  'b75b4dc94800d214ebbc0c60f938235fd2175b96827f59e62d10b945fcc0a65f'
  '0efdfb60c908ef0a75356d827e087e3afd4b66881ed895951bcc3e98360eac3a'
  'd12d1e25e0c52d654645a9d7aa344876c1d7d93876952b0b3bbc477735e27f14'
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
