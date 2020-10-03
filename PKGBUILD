# Contributor: Anton Kudelin <kudelin at protonmail dot com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=cpdf-git
pkgver=2.3.1.r52.gd51ba0d
pkgrel=1
pkgdesc="A command line toolkit for Portable Document Format"
arch=('x86_64')
license=('custom')
url="https://github.com/johnwhitington/cpdf-source"
depends=('glibc')
makedepends=('ocaml' 'ocaml-findlib' 'camlpdf-git' 'git')
conflicts=("cpdf-bin" "cpdf")
source=("${pkgname%-git}::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --tags | sed 's/-/.r/' | tr - .| cut -c2-
}

build() {
  cd ${pkgname%-git}
  make -j1
}

package() {
  cd ${pkgname%-git}
  install -Dpm755 ${pkgname%-git} -t "$pkgdir"/usr/bin
  install -Dpm644 ${pkgname%-git}.1 -t "$pkgdir"/usr/share/man/man1
  sed -e "s:cpdfmanual.pdf:/usr/share/doc/$_pkgname/&:g" -i "$pkgdir"/usr/share/man/man1/${pkgname%-git}.1
  install -Dpm644 cpdfmanual.pdf -t "$pkgdir"/usr/share/doc/${pkgname%-git}
  install -Dpm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
