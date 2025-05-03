# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=devtoolbox
pkgver=1.2.5
pkgrel=1
pkgdesc="Development tools at your fingertips"
arch=('any')
url="https://github.com/aleiepure/devtoolbox"
license=(
  'CC0-1.0'
  'GPL-3.0-or-later'
  'LGPL-3.0-or-later'
  'MIT'
  'Unlicense'
)
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
  'python-rcssmin'
  'python-rjsmin'
  'python-ruamel.yaml.string'
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
source=("git+https://github.com/aleiepure/devtoolbox#tag=v$pkgver")
sha256sums=('b9e5a2ef6238c59e46f6233071e4dad6756f5ac72b64c5203f6ca843bd09f75d')

build() {
  arch-meson "$pkgname" build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs || :
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"

  cd "$pkgname"
  install -Dm644 LICENSES/MIT.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
