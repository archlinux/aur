# Maintainer: Muflone <webreg(at)vbsimple.net>
# Contributor: Tom Vincent <http://tlvince.com/contact/>

pkgname=mkdn-git
pkgver=2e43ac2
pkgrel=1
pkgdesc="Markdown previewer"
arch=(any)
url="https://github.com/rupa/mkdn"
license=('custom:WTFPL')
depends=('pywebkitgtk' 'python2-markdown')
makedepends=('git')
source=("${pkgname%-*}"::"git://github.com/rupa/mkdn"
        "license"::"http://www.wtfpl.net/txt/copying/")
md5sums=('SKIP'
         '8365d07beeb5f39d87e846dca3ae7b64')
conflicts=('python2-mkdn-git')
replaces=('python2-mkdn-git')

pkgver() {
  cd "${pkgname%-*}"
  git describe --always | sed 's|-|.|g'
}

prepare() {
  cd "${pkgname%-*}"
  # The filename was changed from mkdn.py to mkdn
  # the comments in the script will follow the same rule
  sed -i 's/mkdn.py/mkdn/' mkdn.py
}

package() {
  install -D -m755 "${pkgname%-*}/mkdn.py" "${pkgdir}/usr/bin/mkdn"
  install -D -m644 "${srcdir}/license" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}

