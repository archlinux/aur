# Maintainer: The-Repo-Club <The-Repo-Club@github.com>
# Contributor: The-Repo-Club <The-Repo-Club@github.com>

pkgbase=wmappearance
pkgname=(wmappearance wmappearance-gtk3)
pkgver=2021.01.28
pkgrel=1
pkgdesc='Feature-rich GTK+ theme switcher for window managers'
arch=('any')
license=('CC BY-NC-SA 4.0')
url="https://github.com/The-Repo-Club/$pkgname"
depends=('gtk2' 'gtk3')
makedepends=('intltool' 'dbus-glib')
source=("${pkgname}-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=('268d7f8f40f023156b9eec6e2d7460560c1d00a3da09fd8f3c108dc94bf6bad8')

build() {
  # GTK+ 2 version
  cd "$pkgname-$pkgver/gtk2"
  ./configure --sysconfdir=/etc --prefix=/usr --enable-dbus
  make

  cd "$srcdir"
  # GTK+ 3 version
  cd "$pkgname-$pkgver/gtk3"
  ./configure --sysconfdir=/etc --prefix=/usr --enable-dbus --enable-gtk3
  make
}

package_wmappearance() {
  groups=('therepoclub')
  depends=('gtk2')

  cd "$pkgbase-$pkgver/gtk2"
  make DESTDIR="$pkgdir" install
}

package_wmappearance-gtk3() {
  groups=('therepoclub')
  pkgdesc+=' (GTK+ 3 version)'
  depends=('gtk3')
  conflicts=('wmappearance')

  cd "$pkgbase-$pkgver/gtk3"
  make DESTDIR="$pkgdir" install
}
