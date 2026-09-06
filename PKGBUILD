# Maintainer: ParticleG <particle_g@outlook.com>

pkgname=wegame-dwproton
pkgver=7.06.27.1446
pkgrel=4
pkgdesc='Unofficial bundled DWProton integration for Tencent WeGame'
arch=('x86_64')
url='https://github.com/ParticleG/wegame-dwproton'
license=(
  '0BSD'
  'BSD-2-Clause'
  'BSD-3-Clause'
  'LGPL-2.1-only'
  'Zlib'
  'MIT'
  'MPL-2.0'
  'OFL-1.1'
  'LicenseRef-WeGame-EULA'
)
depends=(
  'bash'
  'coreutils'
  'hicolor-icon-theme'
  'python'
  'python-filelock'
  'python-xlib'
  'util-linux'
  'xorg-server-xephyr'
  'xorg-xwayland'
  'xorg-twm'
)
makedepends=('7zip' 'imagemagick')
optdepends=('libnotify: desktop error notifications')
options=('!strip' '!debug' 'emptydirs')
install="$pkgname.install"
_dwproton_version='11.0-12'
_dwproton_dir="dwproton-${_dwproton_version}-${CARCH}"

source=(
  "$pkgname-${pkgver}.exe::https://dldir1.qq.com/tgc/wegame/miniloader/WeGameMiniLoader.std.${pkgver}.exe"
  "${_dwproton_dir}.tar.xz::https://dawn.wine/dawn-winery/dwproton/releases/download/dwproton-${_dwproton_version}/${_dwproton_dir}.tar.xz"
  'wegame-dwproton'
  'wegame-nested-x11-fix'
  'wegame-twmrc'
  'wegame-dwproton.desktop'
  'wegame-dwproton.install'
  'LICENSE'
  'WeGame-EULA.txt'
)
noextract=("$pkgname-${pkgver}.exe")
sha256sums=(
  '0948beca682116a643629c93ff787d2602b599b4ca1c586d8b2c02a7f4ef6d26'
  'SKIP'
  '975c48d6ad9492d186b2488117a9420935eb85a12f432826b990dc1b3e00faf9'
  'd00f636074418477c84b0f48f89860e2a40ddc02aedbb80a27f773b446ee203f'
  'e5226b324e862ac81ef975dc82b75e863eb3b1733e9683296ed13916d7e3012e'
  '0efdfb60c908ef0a75356d827e087e3afd4b66881ed895951bcc3e98360eac3a'
  'fe8ebb07be1633b8a83e80a0dda6a3f8e834febcd4069d78dc9724af998937fc'
  'a0e144decd47d1b87623ae6224e5d4c4b3957768179a7c7933a93ec4f5b316c4'
  '0d41216d7887ecc574ba0a92de6fde21cde94a49c66cde77e80deacd50f1a9d9'
)
sha512sums=(
  'SKIP'
  'acea3ca24f3c08cbae11066abbb7f4481c4e21bd1d11bd3ce072641707b593b40b3518472230a34a5b7426bd3a42ab060b943b05995194379df476b2772bc399'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
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
  install -Dm755 "$srcdir/wegame-nested-x11-fix" \
    "$pkgdir/usr/share/$pkgname/wegame-nested-x11-fix"
  install -Dm644 "$srcdir/wegame-twmrc" \
    "$pkgdir/usr/share/$pkgname/wegame-twmrc"
  install -Dm644 "$srcdir/$pkgname-${pkgver}.exe" \
    "$pkgdir/usr/share/$pkgname/WeGameMiniLoader.exe"
  install -d "$pkgdir/usr/share/$pkgname/dwproton"
  cp -a "$srcdir/$_dwproton_dir/." \
    "$pkgdir/usr/share/$pkgname/dwproton/"
  install -Dm644 "$srcdir/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$srcdir/$pkgname.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
  install -Dm644 "$srcdir/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/0BSD.txt"
  install -Dm644 "$srcdir/WeGame-EULA.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/WeGame-EULA.txt"
  install -Dm644 "$srcdir/$_dwproton_dir/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/dwproton/LICENSE"
  install -Dm644 "$srcdir/$_dwproton_dir/LICENSE.OFL" \
    "$pkgdir/usr/share/licenses/$pkgname/dwproton/LICENSE.OFL"
  install -Dm644 "$srcdir/$_dwproton_dir/PATENTS.AV1" \
    "$pkgdir/usr/share/licenses/$pkgname/dwproton/PATENTS.AV1"
}
