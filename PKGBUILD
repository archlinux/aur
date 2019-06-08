## Maintainer: khanhas <xuankhanh963@gmail.com>
pkgname=spicetify-cli
pkgver=0.9.0
pkgrel=1
pkgdesc='Command-line tool to customize Spotify client'
arch=('x86_64' 'i686')
url='https://github.com/khanhas/spicetify-cli'
license=('GPL')
makedepends=('git' 'go-pie')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('60b533c91eb6132e091104e87fe30e972f6fcff3496a7de95bef357bfb1dc6ec')

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
