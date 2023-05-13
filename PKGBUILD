# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=devtoolbox
pkgver=1.0.2+10+g4da75ee
pkgrel=1
pkgdesc="Development tools at your fingertips"
arch=('any')
url="https://github.com/aleiepure/devtoolbox"
license=('CC0-1.0' 'GPL3' 'MIT' 'Unlicense')
depends=('gtksourceview5' 'libadwaita' 'python-asn1crypto' 'python-croniter'
         'python-daltonlens' 'python-dateutil' 'python-gobject' 'python-humanize'
         'python-lxml' 'python-markdown2' 'python-numpy'
         'python-pillow' 'python-pygments' 'python-pyjwt' 'python-python-crontab'
         'python-python-lorem' 'python-pytz' 'python-ruamel-yaml' 'python-sqlparse'
         'python-textstat' 'python-tzlocal' 'python-uuid6' 'webkitgtk-6.0')
makedepends=('git' 'meson')
checkdepends=('appstream-glib')
_commit=4da75ee8e66a9de27461490147116660778a70b8
source=("git+https://github.com/aleiepure/devtoolbox#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --tags | sed 's/^v//;s/-/+/g'
}

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
  install -Dm644 LICENSES/{CC0-1.0.txt,MIT.txt} -t \
    "$pkgdir/usr/share/licenses/$pkgname/"
}
