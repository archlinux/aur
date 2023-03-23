# Maintainer: Dmitry Lyashuk <lyashuk.voxx at gmail dot com>
pkgname=doom2d-classic
pkgver=1.41b
pkgrel=1
pkgdesc="Doom-themed platformer by Prikol Software, original (classic) version."
arch=(any)
url="https://doom2d.org/"
license=('unknow')
depends=(dosbox)
makedepends=(unrar)
provides=(doom2d-classic)
source=(
  'https://www.doom2d.org/files/d2d/D2Dv140.rar'
  'https://deadsoftware.ru/files/terminalhash/doom2df-packages/d2d_arms.rar'
  
  'doom2d-classic.desktop'
  'doom2d-editor.desktop'
  'doom2d-setup.desktop'
  
  'doom2d-classic.png'
  'doom2d-editor.png'
  'doom2d-setup.png'
  
  'doom2d-classic'
  'doom2d-editor'
  'doom2d-setup'
)
noextract=(
  'D2Dv140.rar'
  'd2d_arms.rar'
)
md5sums=(
  # Archives
  'd61bea6627a5c9aa0181f377fb24ed46'
  '391c481cb918f6a01da6f81d0730bdc5'
  
  # Desktop files
  'be628bf58ca3ed597a11d9d2297d3fa3'
  '45e1ed0b402c1df9b56d6b4e978f2e54'
  '31ede2e55edac3dfd5b6e1ad502e0fb1'
  
  # Icons
  '9e3f78a5f7d779b4050bc7e7659822f4'
  '7e3c0ee7f736c862bb713bf6cc2820bd'
  '1f7f7a4b1635fead94884cf0d81090e2'
  
  # Scripts
  '5079ef74ce0c14623b147ee86269a3d8'
  '91cc1b43530a99a5f36a5ca7c4e773b7'
  '457f048b1ad9e5c2076b139f59f58fc6'
  
)
install=doom2d.install

prepare() {
  mkdir "$srcdir"/D2Dv140
  cd D2Dv140
  unrar x ../D2Dv140.rar
  cd ..
  unrar x d2d_arms.rar
}

package() {
  cd "$srcdir"/D2Dv140
  install -Dm644 DEFAULT.CFG "${pkgdir}"/opt/doom2d/DEFAULT.CFG
  install -Dm644 DOOM2D.WAD "${pkgdir}"/opt/doom2d/DOOM2D.WAD
  install -Dm644 DOS4GW.EXE "${pkgdir}"/opt/doom2d/DOS4GW.EXE
  install -Dm644 Doom2d.txt "${pkgdir}"/opt/doom2d/Doom2d.txt
  install -Dm644 EDITOR.EXE "${pkgdir}"/opt/doom2d/EDITOR.EXE
  install -Dm644 MEGADM.WAD "${pkgdir}"/opt/doom2d/MEGADM.WAD
  install -Dm644 SETUP.EXE "${pkgdir}"/opt/doom2d/SETUP.EXE
  install -Dm644 SUPERDM.WAD "${pkgdir}"/opt/doom2d/SUPERDM.WAD
  install -Dm644 ZADOOMKA.WAD "${pkgdir}"/opt/doom2d/ZADOOMKA.WAD
  
  cd .. && cd d2d_arms
  install -Dm644 d2d_arms.exe "${pkgdir}"/opt/doom2d/doom2d.exe
  install -Dm644 weapons.txt "${pkgdir}"/opt/doom2d/weapons.txt
  
  cd ../../..
  #Desktop files
  install -Dm644 doom2d-classic.desktop "${pkgdir}"/usr/share/applications/doom2d-classic.desktop
  install -Dm644 doom2d-editor.desktop "${pkgdir}"/usr/share/applications/doom2d-editor.desktop
  install -Dm644 doom2d-setup.desktop "${pkgdir}"/usr/share/applications/doom2d-setup.desktop
  
  # Icons
  install -Dm644 doom2d-classic.png "${pkgdir}"/usr/share/pixmaps/doom2d-classic.png
  install -Dm644 doom2d-editor.png "${pkgdir}"/usr/share/pixmaps/doom2d-editor.png
  install -Dm644 doom2d-setup.png "${pkgdir}"/usr/share/pixmaps/doom2d-setup.png
  
  # Scripts
  install -Dm755 doom2d-classic "${pkgdir}"/usr/bin/doom2d-classic
  install -Dm755 doom2d-editor "${pkgdir}"/usr/bin/doom2d-editor
  install -Dm755 doom2d-setup "${pkgdir}"/usr/bin/doom2d-setup
  
}
