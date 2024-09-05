# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=devtoolbox
pkgver=1.1.1
pkgrel=2
pkgdesc="Development tools at your fingertips"
arch=('any')
url="https://github.com/aleiepure/devtoolbox"
license=('CC0-1.0 AND GPL-3.0-or-later AND LGPL-3.0-or-later AND MIT AND Unlicense')
depends=(
  'gcr-4'
  'gtksourceview5'
  'libadwaita'
  'python-asn1crypto'
  'python-croniter'
  'python-cssbeautifier'
  'python-daltonlens'
  'python-dateutil'
  'python-gobject'
  'python-humanize'
  'python-jsbeautifier'
  'python-jsonschema'
  'python-lxml'
  'python-markdown2'
  'python-numpy'
  'python-pillow'
  'python-pygments'
  'python-pyjwt'
  'python-python-crontab'
  'python-python-lorem'
  'python-pytz'
  'python-qrcode'
  'python-ruamel-yaml'
  'python-sqlparse'
  'python-textstat'
  'python-tzlocal'
  'python-uuid6'
  'webkitgtk-6.0'
)
makedepends=(
  'blueprint-compiler'
  'git'
  'meson'
)
checkdepends=(
  'appstream-glib'
)
source=("git+https://github.com/aleiepure/devtoolbox#tag=v$pkgver")
sha256sums=('987aa3d16fbd02f5b5ac3b249673f3f5b6806be076a782be04078dea1e9fb30b')

build() {
  arch-meson "$pkgname" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"

  cd "$pkgname"
  install -Dm644 LICENSES/MIT.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
