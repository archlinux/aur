# Maintainer: Patrick Schratz <patrick.schratz@gmail.com>
# Maintainer: Jared Allard <jaredallard@outlook.com>
# code adapted from https://github.com/jaredallard/notion-app

pkgname=notion-app
pkgver=1.0.5
pkgrel=1
pkgdesc="The all-in-one workspace for your notes and tasks"
arch=('i686' 'x86_64')
url="https://www.notion.so/desktop"
license=('MIT')
depends=('electron')
makedepends=('dmg2img' 'p7zip')
source=("https://desktop-release.notion-static.com/Notion-"${pkgver}".dmg" 'notion-app')
md5sums=('e742641e62819e7ffe48c5cae09c4ee1'
         'c6e87309eebe3dfdd206e4c399fffebb')

build() {
  msg "Converting dmg image..."
  mkdir -p tmp/build || true
  dmg2img "Notion-"${pkgver}".dmg" "Notion-"${pkgver}".img" >/dev/null
  7z x -y "Notion-"${pkgver}".img" >/dev/null
  cp -r Notion**/Notion.app/Contents/Resources/* tmp/build
  cp notion-app tmp/build
} 

package() {
  echo "$pkgdir"
  mkdir -p "$pkgdir/usr/bin" "$pkgdir/opt/notion-app"
  cp -r tmp/build/* "$pkgdir/opt/notion-app/"
  install -D -m755 notion-app "$pkgdir/usr/bin/notion-app"
}

