# Maintainer: Alain Kalker <a.c.kalker@gmail.com>
_pkgname=Shen
pkgname=shen-sbcl
_version=19.1
_port=1.9
pkgver=$_version.p$_port
pkgrel=1
pkgdesc="A portable functional programming language (SBCL port)"
arch=('i686' 'x86_64')
url="http://www.shenlanguage.org/"
license=('BSD')
depends=('zlib')
makedepends=('sbcl')
provides=('shen')
options=(!strip)
source=(http://www.shenlanguage.org/Download/Shen-SBCL-Linux.zip)
md5sums=('4c58bd0542044fe93539b176dd7e4e2a')

build() {
  cd "$_pkgname $_version"

  cd Platforms/SBCL
  ln -sf "../../KLambda"/*.kl .
  sbcl --no-userinit --load install.lsp
}

package() {
  cd "$_pkgname $_version"

  # binary
  install -Dm755 Platforms/SBCL/Shen.exe "$pkgdir/usr/bin/Shen"

  # documentation
  install -d -m755 "$pkgdir/usr/share/doc/$pkgname"
  cp -a Doc/* "$pkgdir/usr/share/doc/$pkgname/"

  # license
  install -d -m755 "$pkgdir/usr/share/licenses/$pkgname"
  cp BSD license.pdf "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 et:
