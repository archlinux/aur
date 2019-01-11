## Maintainer: khanhas <xuankhanh963@gmail.com>
pkgname=spicetify-cli
pkgver=0.4.1
pkgrel=1
pkgdesc='Command-line tool to customize Spotify client'
arch=('x86_64' 'i686')
url='https://github.com/khanhas/spicetify-cli'
license=('GPL')
makedepends=('go-pie')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('29b065c3b5b1acab71977371fcb488b2f9af4d854ce1e57f9522398799894a7d')

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
  cp -r ./Themes ./Extensions ./jsHelper ./globals.d.ts "$pkgdir"/usr/share/$pkgname
  
  rm -f ./shortcut
  echo "#!/bin/sh 
/usr/share/$pkgname/spicetify \"\$@\"" >> ./shortcut
  
  install -Dm755 ./shortcut "$pkgdir"/usr/bin/spicetify
}
