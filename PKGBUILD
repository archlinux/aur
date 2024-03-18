# Maintainer: Pfych <contact at pfy dot ch>
pkgname=lr2oraja-endlessdream
pkgver=0.2.0
_basever=0.8.7
pkgrel=1
url="https://github.com/seraxis/lr2oraja-endlessdream"
pkgdesc="A featureful fork of beatoraja."
arch=('x86_64')
depends=('liberica-jre-8-full-bin' 'portaudio' 'lr2oraja')
makedepend=('unzip')
source=(
  "https://github.com/seraxis/lr2oraja-endlessdream/releases/download/v${pkgver}/lr2oraja-${_basever}-endlessdream-linux-${pkgver}.zip"
  'lr2oraja-endlessdream.sh'
  'lr2oraja-endlessdream-icon.png'
)
sha256sums=(
  '1688a08ac547b891977bdf53cb80f0f458f2bce36acaa8260d273fdb16a7c677' # LR2oraja-endlessdream.zip
  'aa670db982f72e0c7cfce539bcc28888a242c386f42b032b0b9ec3c3cd3cb3c8' # lr2oraja-endlessdream.sh
  'fdbd37ff43aa6af20f9eb643bf271a77ef579014970a7a3dcecf78e65123d83d' # lr2oraja-endlessdream-icon.png
)
license=(
  'GPL3'
  'GPL3'
  'MIT'
)

prepare() {
  unzip -o "lr2oraja-${_basever}-endlessdream-linux-${pkgver}.zip"
}

package() {
  # Create required directories
  cd "$srcdir/"
  mkdir -p "$pkgdir/opt/beatoraja"
  mkdir -p "$pkgdir/usr/share/applications"
  mkdir -p "$pkgdir/usr/share/pixmaps"
  mkdir -p "$pkgdir/opt/beatoraja/font"


  # Move new Jar
  cp "lr2oraja-${_basever}-endlessdream-linux-${pkgver}.jar" "$pkgdir/opt/beatoraja/LR2oraja-endlessdream.jar" 
  chmod -R 777 "$pkgdir/opt/beatoraja"

  # Move required font
  cp font/* "$pkgdir/opt/beatoraja/font"

  # Create Desktop entry
  cp lr2oraja-endlessdream-icon.png "$pkgdir/usr/share/pixmaps"
  desktopEntry="$pkgdir/usr/share/applications/lr2oraja-endlessdream.desktop"
  touch "$desktopEntry"
  echo "[Desktop Entry]" >> "$desktopEntry"
  echo "Type=Application" >> "$desktopEntry"
  echo "Terminal=true" >> "$desktopEntry"
  echo "Exec=/usr/bin/lr2oraja-endlessdream" >> "$desktopEntry"
  echo "Version=$pkgver" >> "$desktopEntry"
  echo "Name=LR2oraja Endless Dream" >> "$desktopEntry"
  echo "Categories=Game;" >> "$desktopEntry"
  echo "Icon=lr2oraja-endlessdream-icon" >> "$desktopEntry"
  
  if [ -z "$XDG_CONFIG_HOME" ]; then
    XDG_CONFIG_HOME="$HOME/.config"
  fi

  # Install LR2oraja
  install -D lr2oraja-endlessdream.sh "$pkgdir/usr/bin/lr2oraja-endlessdream"
}
