# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=metagedit-git
pkgver=r65.d3d57a8
pkgrel=2
pkgdesc="Gedit plugin which adds multiple improvements and functionalities to it"
arch=('any')
url="https://github.com/pedrovernetti/metagedit"
license=('GPL-3.0-or-later')
depends=('gedit' 'python-chardet' 'python-gobject' 'python-iso639')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/pedrovernetti/metagedit.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgname%-git}"
  install -Dm644 "plugin/${pkgname%-git}"/*.py -t \
    "$pkgdir/usr/lib/gedit/plugins/${pkgname%-git}/"
  install -m644 "plugin/${pkgname%-git}.plugin" -t \
    "$pkgdir/usr/lib/gedit/plugins/"
  install -Dm644 "org.gnome.gedit.plugins.${pkgname%-git}.gschema.xml" -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
}
