# Maintainer: Yaron de Leeuw < me@jarondl.net >
# Maintained at : https://github.com/jarondl/aur-pkgbuilds-jarondl

pkgname=idok
pkgdesc="A simple command line to stream media to kodi (aka xbmc)"
url="https://metal3d.github.io/idok/"
pkgver=0.2.9
pkgrel=1
arch=('x86_64' 'i686')
license=('BSD')
makedepends=('go')
depends=('glibc')

_gourl=('github.com/metal3d/idok/')

source=("$pkgname-$pkgver::https://github.com/metal3d/idok/archive/v$pkgver.tar.gz")
sha256sums=('5b4643420e82c8f35d277962cd6ef29ee45c2cd56e271ea35926b6db3ab614ad')


build() {
  cd "$pkgname-$pkgver"
  # <go tricks>
  # I want go to find the local subdirectories instead of online.
  # Maybe that's not the correct way. Ideas are welcome.
  mkdir -p "src/$_gourl"
  cp -r {asserver,utils,tunnel} "src/$_gourl"
  # </go tricks>
  GOPATH="$PWD" go build
}

package (){
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
