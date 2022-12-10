_pkgname=asteroids
pkgname=${_pkgname}-bin
pkgver=1.05
pkgrel=3
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
source=("$_pkgzip::https://codeberg.org/attachments/aa0bfe2a-6043-45d5-bea3-ea1e0d3a9ef8"
        Asteroids.desktop)
sha256sums=('5ceaf1cc69a1e2a0ffada6195d9add9e2c201d4850eea810752a14b430a76278'
            '1c94a27e1ca64442c52c5369de72f9d18b33942551bc27d8806e7796c5fb7b6c')

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
