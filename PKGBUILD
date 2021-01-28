# Maintainer: TheCynicalTeam <TheCynicalTeam@github.com>
# Contributor: TheCynicalTeam <TheCynicalTeam@github.com>

pkgbase=wmappearance
pkgname=(wmappearance wmappearance-gtk3)
pkgver=2021.01.28
pkgrel=1
pkgdesc='Feature-rich GTK+ theme switcher for window managers'
arch=('any')
license=('CC BY-NC-SA 4.0')
url="https://github.com/TheCynicalTeam/$pkgname"
depends=('gtk2' 'gtk3')
makedepends=('intltool' 'dbus-glib')
source=("${pkgname}-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=('d0e9abeb6c9113f5e741bc429b83987f34af77c56a5808a068cc9c21f1773de2')

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
