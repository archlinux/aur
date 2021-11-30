# Maintainer: malacology <GuoyiZhang at tmalacology dot net>
pkgname=gnome-shell-extension-blur-my-shell
_pkgname=blur-my-shell
pkgver=25
pkgrel=1
pkgdesc="Extension that adds a blur look to different parts of the GNOME Shell"
arch=('any')
url="https://github.com/aunetx/blur-my-shell"
license=('MIT')
depends=('gnome-shell')
provides=("$pkgname")
conflicts=("$pkgname-git")
source=("https://github.com/aunetx/blur-my-shell/archive/refs/tags/v$pkgver.zip")
sha256sums=('506be208bfc4ccbb9b553f55484b3e6105aa3060173f517db8d0f0031615334a')
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
