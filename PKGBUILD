# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=devtoolbox
pkgver=1.0
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
sha256sums=('731d3ab3b4712231e0fb5ee4fcc7517450eba4964c46a241f45933d2490d480b')

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
