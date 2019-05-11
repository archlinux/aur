## Maintainer: khanhas <xuankhanh963@gmail.com>
pkgname=spicetify-cli
pkgver=0.8.0
pkgrel=1
pkgdesc='Command-line tool to customize Spotify client'
arch=('x86_64' 'i686')
url='https://github.com/khanhas/spicetify-cli'
license=('GPL')
makedepends=('git' 'go-pie')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('d2e1189808f4100e786a9bceb4f5a11560466f1eb39a03948a33723a7c1fe2ef')

build() {
  cd "$pkgname-$pkgver"
  go build -o spicetify
}

check() {
  cd "$pkgname-$pkgver"
  ./spicetify -v
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 ./spicetify "$pkgdir"/usr/share/$pkgname/spicetify
  cp -r ./Themes ./Extensions ./CustomApps ./jsHelper ./globals.d.ts "$pkgdir"/usr/share/$pkgname
  
  rm -f ./shortcut
  echo "#!/bin/sh 
/usr/share/$pkgname/spicetify \"\$@\"" >> ./shortcut
  
  install -Dm755 ./shortcut "$pkgdir"/usr/bin/spicetify
}
