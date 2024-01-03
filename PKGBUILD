# Maintainer: Pfych <contact at pfy dot ch>
pkgname=lr2oraja-endlessdream
pkgver=0.1.1
_basever=0.8.6
pkgrel=1
pkgdesc="A featureful fork of beatoraja."
arch=('x86_64')
depends=('liberica-jre-8-full-bin' 'portaudio' 'lr2oraja')
makedepend=('unzip')
source=(
  "https://github.com/seraxis/lr2oraja-endlessdream/releases/download/v0.1.1/lr2oraja-${_basever}-endlessdream-linux-${pkgver}.jar"
  'lr2oraja-endlessdream.sh'
  'lr2oraja-endlessdream-icon.png'
)
sha256sums=(
  'd09e8b3838b29e702edc8ad42aa49b323f722ac42d0180451a12f530fb61655c' # LR2oraja-endlessdream.jar
  '00f25e5f709943171f0a9fb6db77e103845f5538bdd385c06e2b7598fab0140d' # lr2oraja-endlessdream.sh
  'fdbd37ff43aa6af20f9eb643bf271a77ef579014970a7a3dcecf78e65123d83d' # lr2oraja-endlessdream-icon.png
)
license=(
  'GPL3'
  'GPL3'
  'MIT'
  'unknown'
  'unknown'
)

package() {
  # Create required directories
  cd "$srcdir/"
  mkdir -p "$pkgdir/opt/beatoraja"
  mkdir -p "$pkgdir/usr/share/applications"
  mkdir -p "$pkgdir/usr/share/pixmaps"


  # Move new Jar
  cp "lr2oraja-${_basever}-endlessdream-linux-${pkgver}.jar" "$pkgdir/opt/beatoraja/LR2oraja-endlessdream.jar" 
  chmod -R 777 "$pkgdir/opt/beatoraja"

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
  echo "Categories=Games;" >> "$desktopEntry"
  echo "Icon=lr2oraja-icon-endlessdream" >> "$desktopEntry"
  
  if [ -z "$XDG_CONFIG_HOME" ]; then
    XDG_CONFIG_HOME="$HOME/.config"
  fi

  # Install LR2oraja
  install -D lr2oraja-endlessdream.sh "$pkgdir/usr/bin/lr2oraja-endlessdream"
}
