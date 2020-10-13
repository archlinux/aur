# Maintainer: Burgess Chang <open@brsvh.org>
pkgname=ukui-themes-git
pkgrel=1
pkgver=r34.34155adc
pkgdesc="Official themes for the UKUI desktop, Development master branch."
arch=('x86_64' )
url="https://github.com/ukui/ukui-themes"
license=('GPL')
depends=('dconf')
makedepends=('git' 'ruby-sass')
conflicts=('ukui-themes')
replaces=('ukui-themes')
source=("ukui-themes-git::git://github.com/ukui/ukui-themes.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/ukui-themes-git"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/ukui-themes-git"
  make
}

package() {
  cd "$srcdir/ukui-themes-git"
  make DESTDIR="$pkgdir" install
  install -Dm644 debian/25_ukui-themes.gschema.override -t "$pkgdir"/usr/share/glib-2.0/schemas/
  install -dm755 "$pkgdir"/usr/share/icons
  cp -a ukui-icon-theme* "$pkgdir"/usr/share/icons/
  install -Dm644 ukui-custom.xml -t "$pkgdir"/usr/share/mime/packages/
}
