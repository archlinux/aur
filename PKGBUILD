# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=nscript-git
pkgver=20100904
pkgrel=1
pkgdesc="A simple stack-based scripting language."
url="http://github.com/nikki93/nscript"
arch=('i686' 'x86_64')
license=('custom:none')
makedepends=("git")
conflicts=("nscript")
provides=("nscript")
source=('git://github.com/nikki93/nscript.git')
md5sums=('SKIP')

_gitname="nscript"

pkgver() {
  cd "$_gitname"
  git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

build() {
  cd "$_gitname"
  make
}

package()
{
  cd "$_gitname"
  # No destdir, no prefix.  Let's do it by hand!
  install -d "$pkgdir/usr/bin/"
  install -d "$pkgdir/usr/lib/"
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm755 ns "$pkgdir/usr/bin/nscript"
  install -Dm644 libnscript.a "$pkgdir/usr/lib/"
  touch "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
