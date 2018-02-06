# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=conversejs-git
pkgver=3.3.2.r6.gc5d4d421a
pkgrel=1
pkgdesc='Web-based XMPP/Jabber chat client written in javascript'
arch=('any')
url="https://conversejs.org/"
license=('MPL2')
makedepends=('git' 'npm' 'ruby-rdoc')
source=('git+https://github.com/jcbrand/converse.js')
md5sums=('SKIP')

pkgver() {
  cd converse.js
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd converse.js
  rm -rf dist
  rm -f css/converse*
  make dev
  make build
}

package() {
  cd converse.js
  install -dm755 "$pkgdir"/usr/share/webapps/converse.js/
  cp -r dist "$pkgdir"/usr/share/webapps/converse.js/
  cp -r css "$pkgdir"/usr/share/webapps/converse.js/
  cp -r locale "$pkgdir"/usr/share/webapps/converse.js/
  cp -r sounds "$pkgdir"/usr/share/webapps/converse.js/

  install -dm755 "$pkgdir"/usr/share/webapps/converse.js/fonticons/fonts/
  install -Dm644 fonticons/fonts/* "$pkgdir"/usr/share/webapps/converse.js/fonticons/fonts/
}
