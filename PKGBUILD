# Maintainer: Steven Allen <steven@stebalien.com>

pkgname=jauth-git
pkgver=63
pkgrel=1
pkgdesc="A reference desktop client for the google authenticator"
arch=('any')
url="https://github.com/mclamp/JAuth"
license=('custom')
depends=('java-environment' 'sh')
makedepends=('git')
source=('git://github.com/mclamp/JAuth.git'
        'jauth.sh')

sha256sums=('SKIP'
            '137f1d78427323771b4307031fa71607a48ea1d026bab65e00b84d8236d9b3e2')

pkgver() {
  cd JAuth
  git rev-list --count HEAD
}

build() {
  cd JAuth
  ./makejar
}

package() {
  install -Dm644 JAuth/JAuth.jar "$pkgdir/usr/share/jauth/JAuth.jar"
  install -Dm755 jauth.sh "$pkgdir/usr/bin/jauth"
  install -Dm644 JAuth/README "$pkgdir/usr/share/doc/jauth/README"
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname/"
  cd "$pkgdir/usr/share/licenses/$pkgname"
  ln -s ../../doc/jauth/README README
}

# vim:set ts=2 sw=2 et:
