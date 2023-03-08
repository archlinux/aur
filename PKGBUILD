# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=devtoolbox
pkgver=1.0.2
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
sha256sums=('fe6c63d2320c85082668c6a8ccf06900347d32039f44dcd3359392c2b7b0f859')

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
