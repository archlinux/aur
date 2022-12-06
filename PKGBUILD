_pkgname=asteroids
pkgname=${_pkgname}-bin
pkgver=1.03
pkgrel=5
pkgdesc='Anti-stress shooter game'
url='https://codeberg.org/Denotatum/Asteroids'
license=('GPLv3')
arch=('x86_64')
provides=('asteroids')
replaces=($pkgname)
conflicts=($pkgname)
depends=('alsa-lib' 'glu' 'libglvnd' 'libxcursor' 'libxinerama' 'libxi' 'libxrandr' 'mesa' 'pulseaudio')
optdepends=()
makedepends=('unzip')
_pkgtag="$pkgname-$pkgver"
_pkgzip="$_pkgtag.zip"
noextract=("$_pkgzip")
install="${pkgname}.install"
source=("$_pkgzip::https://codeberg.org/attachments/b370bf94-2b81-4ee6-886a-59d5225992fc"
        Asteroids.desktop)
sha256sums=('0dbfe3bbd25ec9381179ddb5c61b919df14590c75fdf395d678201e807063210'
            'f3be9cdabcd8a64cedff55f83123e054d3300dd60bdc88d29894e06d63f69aa5')

prepare() {
  mkdir -p "$_pkgtag"
  unzip "$_pkgzip" -d "$_pkgtag"
  mv Asteroids.desktop "$_pkgtag"/
  cd "$_pkgtag"
  mkdir ./usr
  mkdir ./usr/bin
  mkdir ./usr/lib
  mkdir ./usr/lib/asteroids
  mkdir ./usr/share
  mkdir ./usr/share/applications
  mkdir ./usr/share/icons
  mkdir ./usr/share/icons/hicolor
  mkdir ./usr/share/icons/hicolor/64x64
  mkdir ./usr/share/icons/hicolor/64x64/apps
  mv Asteroids.x86_64 ./usr/bin/asteroids
  mv Asteroids.pck ./usr/lib/asteroids
  mv Asteroids.desktop ./usr/share/applications/
  mv index.icon.png ./usr/share/icons/hicolor/64x64/apps/asteroids.png
}

package() {
	cd "$_pkgtag"
	cp -rf ./ "$pkgdir"/
	install -m755 -d "$pkgdir"
} 
