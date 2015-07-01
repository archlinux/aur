# Maintainer: Alain Kalker <a.c.kalker@gmail.com>
_pkgname=Shen
pkgname=shen-sbcl
_version=16
_port=1.7
pkgver=$_version.p$_port
pkgrel=1
pkgdesc="A portable functional programming language (SBCL port)"
arch=('i686' 'x86_64')
url="http://www.shenlanguage.org/"
license=('custom')
depends=('zlib')
makedepends=('sbcl')
provides=('shen')
options=(!strip)
source=(http://shenlanguage.org/Download/Shen.zip)
md5sums=('820885321cca784fdbc2fadbbbaec6e7')

build() {
  cd "$_pkgname $_version"

  cd Platforms/SBCL
  ln -sf "../../K Lambda"/*.kl .
  sbcl --no-userinit --load install.lsp
}

package() {
  cd "$_pkgname $_version"

  # binary
  install -Dm755 Platforms/SBCL/Shen.exe "$pkgdir/usr/bin/Shen"

  # documentation
  install -d -m755 "$pkgdir/usr/share/doc/$pkgname"
  cp -a Specification/* "$pkgdir/usr/share/doc/$pkgname/"

  # license
  install -d -m755 "$pkgdir/usr/share/licenses/$pkgname"
  ln -s /usr/share/doc/$pkgname/license.htm "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 et:
