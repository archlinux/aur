# Maintainer: Stefan Göbel <aur —at— subtype —dot— de>

pkgname='corky'
pkgver='2017033001'
pkgrel='1'
pkgdesc='Some Lua modules for the system monitor Conky.'
url='https://gitlab.com/goeb/corky/'
install="$pkgname.install"
arch=('any')
license=('GPL3')
depends=('conky-cairo' 'lua-lpeg')
source=("$pkgname::git+https://gitlab.com/goeb/$pkgname.git#tag=$pkgver")
sha256sums=('SKIP')

prepare() {

   cd "$pkgname"

   # Change the modules path in the example:
   sed -i 's!"lua/corky.lua"!"/usr/share/lua/5.3/corky.lua"!' 'example/conky.conf'

}

package() {

   cd "$pkgname"

   # Install the modules:
   install -dm 0755 "${pkgdir}/usr/share/lua/5.3"
   cp -a lua/* "${pkgdir}/usr/share/lua/5.3"

   # Install the README file and the example:
   install -dm 0755 "${pkgdir}/usr/share/doc/corky"
   cp -a README  "${pkgdir}/usr/share/doc/corky"
   cp -a example "${pkgdir}/usr/share/doc/corky"

}

#:indentSize=3:tabSize=3:noTabs=true:mode=shellscript:maxLineLen=87: