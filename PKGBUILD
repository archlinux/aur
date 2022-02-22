# Maintainer: malacology <GuoyiZhang at tmalacology dot net>
pkgname=gnome-shell-extension-blur-my-shell
_pkgname=blur-my-shell
pkgver=28
pkgrel=1
pkgdesc="Extension that adds a blur look to different parts of the GNOME Shell"
arch=('any')
url="https://github.com/aunetx/blur-my-shell"
license=('MIT')
depends=('gnome-shell')
provides=("$pkgname")
conflicts=("$pkgname-git")
source=("https://github.com/aunetx/blur-my-shell/archive/refs/tags/v$pkgver.zip")
sha256sums=('d482fe3b74002f623eab76c4b157d4548648cf7588af7bb7b3583a2d2c1e5e8b')
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
