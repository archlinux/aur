# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=devtoolbox
pkgver=1.0.1
pkgrel=1
pkgdesc="Development tools at your fingertips"
arch=('any')
url="https://github.com/aleiepure/devtoolbox"
license=('unknown')
depends=('gtksourceview5' 'libadwaita' 'python-base64io' 'python-croniter'
         'python-python-crontab' 'python-daltonlens' 'python-dateutil' 'python-gobject'
         'python-humanize' 'python-python-lorem' 'python-lxml' 'python-markdown2'
         'python-numpy' 'python-pillow' 'python-pygments' 'python-pyjwt'
         'python-ruamel-yaml' 'python-sqlparse' 'python-textstat' 'python-uuid6'
         'webkit2gtk-5.0')
makedepends=('meson')
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7a87dd408c9d54471aee904ece13ecca9b5d3eb2568f1755127738f8dd5b24e4')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
