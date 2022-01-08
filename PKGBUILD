# Maintainer: malacology <GuoyiZhang at tmalacology dot net>
pkgname=gnome-shell-extension-blur-my-shell
_pkgname=blur-my-shell
pkgver=26
pkgrel=3
pkgdesc="Extension that adds a blur look to different parts of the GNOME Shell"
arch=('any')
url="https://github.com/aunetx/blur-my-shell"
license=('MIT')
depends=('gnome-shell')
provides=("$pkgname")
conflicts=("$pkgname-git")
source=("https://github.com/aunetx/blur-my-shell/archive/refs/tags/v$pkgver.zip")
sha256sums=('b108a7f94162c4f2aba2bd096bfb2b2646ecf0fe4e9619abbd931468513a8bf2')
build() {
  cd "$srcdir/$_pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  _uuid="${_pkgname}@aunetx"
  _schema="org.gnome.shell.extensions.$_pkgname.gschema.xml"

  install -d "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
  cp -r build/* "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/"

  install -d "$pkgdir/usr/share/glib-2.0/schemas/"
  ln -s "/usr/share/gnome-shell/extensions/$_uuid/schemas/$_schema" \
    "$pkgdir/usr/share/glib-2.0/schemas/"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname}"
}

