# Contributor: Peter Bui <pnutzh4x0r@gmail.com>

_pkgname=tamzen-font
pkgname=$_pkgname-git
pkgver=93.7ea70cc
pkgrel=1
pkgdesc="A monospaced bitmap font for the console and X11 (tamsyn-font fork)"
arch=('any')
url="https://github.com/sunaku/tamzen-font"
license=('custom')
depends=()
makedepends=('git')
install=tamzen-font.install
source=("git://github.com/sunaku/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

package () {
  cd "$srcdir/$_pkgname"

  install -d "$pkgdir/usr/share/fonts/local"
  install -m644 bdf/*.bdf "$pkgdir/usr/share/fonts/local/"

  install -d "$pkgdir/usr/share/kbd/consolefonts"
  gzip psf/*.psf
  install -m644 psf/*.psf.gz "$pkgdir/usr/share/kbd/consolefonts/"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README"
}
