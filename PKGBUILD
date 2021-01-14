# Maintainer: Advaith Madhukar <advaith.madhukar at gmail dot com>
pkgname=nuclear-player-git
pkgver=v0.6.5.r80.gf395aa8c
pkgrel=1
pkgdesc="A free, multiplatform music player app that streams from multiple sources."
url="https://nuclear.js.org"
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
arch=(x86_64)
license=('GPL3')
depends=('libnotify' 'libappindicator-gtk3' 'libxtst' 'nss')
makedepends=('git' 'lerna' 'npm' 'nodejs-lts-erbium')
source=(
    'git+https://github.com/nukeop/nuclear.git'
	'nuclear.desktop'
)
md5sums=('SKIP'
		'c7718ef25957c425b87dc4195d811955'
)
pkgver() {
  cd ${srcdir}/nuclear
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
build(){
 cd nuclear
 npm install
 lerna bootstrap
 npm run build
}
package(){
  mkdir ${pkgdir}/usr
  mkdir ${pkgdir}/usr/share
  mkdir ${pkgdir}/usr/share/applications
  mkdir ${pkgdir}/usr/bin
  mkdir ${pkgdir}/usr/share/icons
  mkdir ${pkgdir}/usr/share/icons/hicolor
  mkdir ${pkgdir}/usr/share/icons/hicolor/0x0
  mkdir ${pkgdir}/usr/share/icons/hicolor/0x0/apps/
  cp ${srcdir}/nuclear/flatpak/org.js.nuclear.Nuclear.png ${pkgdir}/usr/share/icons/hicolor/0x0/apps/nuclear.png
  cp --preserve=mode ${srcdir}/nuclear.desktop ${pkgdir}/usr/share/applications/
  cp -r --preserve=mode ${srcdir}/nuclear/release/linux-unpacked/* ${pkgdir}/usr/bin/
}
