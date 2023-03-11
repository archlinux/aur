# Maintainer: Mattia Borda <mattiagiovanni.borda@icloud.com>
pkgname=devtoolbox-git
pkgver=1.0.2.r0.g72739c7
pkgrel=1
pkgdesc='Development tools at your fingertips'
arch=(any)
url=https://github.com/aleiepure/${pkgname%-git}
license=(unknown)
depends=(gtksourceview5 libadwaita python-base64io python-croniter python-python-crontab python-daltonlens python-dateutil python-gobject python-humanize python-python-lorem python-lxml python-markdown2 python-numpy python-pillow python-pygments python-pyjwt python-ruamel-yaml python-sqlparse python-textstat python-uuid6 webkit2gtk-5.0)
makedepends=(git meson)
checkdepends=(appstream-glib)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=(git+$url)
b2sums=(SKIP)

pkgver() {
  cd ${pkgname%-git}
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson ${pkgname%-git} build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
