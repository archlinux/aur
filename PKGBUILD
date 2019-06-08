# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

_pkgname=cpdf
pkgname=$_pkgname-git
pkgver=2.2.1.r45.g9cb5347
pkgrel=1
pkgdesc="A command line toolkit for Portable Document Format"
arch=('x86_64')
license=('custom')
url="https://github.com/johnwhitington/cpdf-source"
depends=('glibc')
makedepends=('ocaml' 'ocaml-findlib' 'camlpdf-git' 'git')
conflicts=("$_pkgname-bin" "$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname-source
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -c 2-
}

build() {
  cd $srcdir/$_pkgname-source
  make -j1
}

package() {
  cd $srcdir/$_pkgname-source
  install -Dpm755 $_pkgname -t $pkgdir/usr/bin
  install -Dpm644 $_pkgname.1 -t $pkgdir/usr/share/man/man1
  sed -e "s:cpdfmanual.pdf:/usr/share/doc/$_pkgname/&:g" -i $pkgdir/usr/share/man/man1/$_pkgname.1
  install -Dpm644 cpdfmanual.pdf -t $pkgdir/usr/share/doc/$_pkgname
  install -Dpm644 LICENSE -t $pkgdir/usr/share/licenses/$pkgname
}
