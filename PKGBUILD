# Maintainer: czyt <czytcn@qq.com>

pkgname=edairy
pkgver=4.3.1
pkgrel=1
pkgdesc="E-Dairy application running with Wine"
arch=('x86_64')
url="http://down.haoxg.net/ediary/download/ediary-4.3.1-win64-copy.zip"
license=('MIT')
depends=('wine' 'unzip')

source=("http://down.haoxg.net/ediary/download/ediary-4.3.1-win64-copy.zip")
sha512sums=('dac9e3b035be4c0d6ccba5b420e3038ad1a3fee5858f980ff4de3d9adaadd6c6e388cf75d0fa53ec2b1c91a5291f55f9b92051e357adf29bdd5001fef74fa53a')

prepare() {
  mkdir -p "$srcdir/extracted"
}

build() {

  cd "$srcdir"||exit
  unzip "$srcdir/ediary-4.3.1-win64-copy.zip" -d "$srcdir/extracted"
}

package() {
  install -d "$pkgdir/opt/edairy"
  cp -r "$srcdir/extracted/." "$pkgdir/opt/edairy/"
  # Create desktop entry
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/edairy.desktop" <<EOF
  # Create desktop entry
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/edairy.desktop" <<EOF
  [Desktop Entry]
  Name=E-Dairy
  Exec=wine %f /opt/edairy/edairy.exe
  Type=Application
  StartupNotify=true
  Icon=edairy
  Categories=Office;
EOF

  # Create symlink for wine.exe if needed
  ln -sf /opt/deepinwine/apps/Deepin-Wine/drive_c/windows/system32/wine.exe "$pkgdir/opt/edairy/wine.exe"
}

