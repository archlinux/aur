# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Mufeed Ali <lastweakness@tuta.io>
pkgname=dialect
pkgver=2.5.0
pkgrel=1
pkgdesc="A translation app for GNOME."
arch=('any')
url="https://apps.gnome.org/Dialect"
license=('GPL-3.0-or-later')
depends=(
  'gst-python'
  'libadwaita'
  'libsecret'
  'libsoup3'
  'python-beautifulsoup4'
  'python-dbus'
  'python-gobject'
  'python-gtts'
)
makedepends=(
  'blueprint-compiler'
  'git'
  'gobject-introspection'
  'meson'
)
source=("git+https://github.com/dialect-app/dialect.git#tag=$pkgver"
        'git+https://github.com/dialect-app/po.git')
sha256sums=('176436d0baf910167c54c3ba7c60da23b70506dccefa8d87154662f04ad4ad67'
            'SKIP')

prepare() {
  cd "$pkgname"
  git submodule init
  git config submodule.po.url "$srcdir/po"
  git -c protocol.file.allow=always submodule update
}

build() {
  arch-meson "$pkgname" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
