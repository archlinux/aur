# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Mufeed Ali <lastweakness@tuta.io>
pkgname=dialect
pkgver=1.4.1
pkgrel=2
pkgdesc="A translation app for GNOME."
arch=('any')
url="https://apps.gnome.org/app/com.github.gi_lom.dialect"
license=('GPL3')
depends=('gst-python' 'gtk3' 'libhandy' 'python-gobject' 'python-googletrans<4.0.0rc1'
         'python-gtts' 'python-httpx>=0.17.1')
makedepends=('git' 'gobject-introspection' 'meson')
checkdepends=('appstream-glib')
conflicts=('gnabel')
replaces=('gnabel')
source=("git+https://github.com/dialect-app/dialect.git#tag=$pkgver"
        'git+https://github.com/dialect-app/po.git')
sha256sums=('SKIP'
            'SKIP')

prepare() {
  cd "$srcdir/$pkgname"
  git submodule init
  git config submodule.po.url $srcdir/po
  git submodule update
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
