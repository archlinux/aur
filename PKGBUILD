# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Konstantinos Foutzopoulos <mail@konfou.xyz>

_pkgname=anarki
pkgname=${_pkgname}-git
pkgver=3.1.r1352.gd0e4804
pkgrel=1
epoch=2
pkgdesc="Community-managed fork of the Arc dialect of Lisp. (GIT version)"
arch=('any')
url="https://github.com/arclanguage/anarki"
license=('MIT' 'PerlArtistic')
depends=('racket' 'bash' 'perl')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/arclanguage/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  git describe --tags| cut -c4- | sed 's+-+.r+' | tr - .
}

package() {
  install -d "$pkgdir"/usr/{bin,share/licenses/$pkgname} 
  cp -R "${_pkgname}" "$pkgdir/usr/share/${_pkgname}"
  rm -rf "$pkgdir"/usr/share/${_pkgname}/.git
  ln -s "/usr/share/${_pkgname}/arc.sh" "$pkgdir/usr/bin/arc"
  install -Dm755 "${_pkgname}"/copyright "$pkgdir"/usr/share/licenses/$pkgname/copyright
}
