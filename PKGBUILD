# Maintainer: Milos <archlinux.7lpxv@simplelogin.co>

pkgname=hunspell-sk-git
_pkgname=hunspell-sk
pkgver=2.4.9.r0.gee4ffc3
pkgrel=1
pkgdesc="Slovak dictionary for Hunspell (git version)"
arch=('any')
url="https://github.com/sk-spell/hunspell-sk"
license=('GPL-2.0-only OR LGPL-2.1-only OR MPL-1.1')
makedepends=('git')
optdepends=('hunspell: Hunspell spell checking library and program')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$_pkgname"

  install -Dm644 sk_SK.dic sk_SK.aff -t "$pkgdir"/usr/share/hunspell
  install -Dm644 doc/{AUTHORS,Copyright,Flagy*} -t "$pkgdir"/usr/share/doc/$_pkgname
  install -Dm644 doc/{GPL,LGPL,MPL} -t "$pkgdir"/usr/share/licenses/$pkgname

  install -d "$pkgdir"/usr/share/myspell/dicts
  ln -s /usr/share/hunspell/sk_SK.dic "$pkgdir"/usr/share/myspell/dicts/sk_SK.dic
  ln -s /usr/share/hunspell/sk_SK.aff "$pkgdir"/usr/share/myspell/dicts/sk_SK.aff
}
