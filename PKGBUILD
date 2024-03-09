# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Erik Wallström <erik.wallstrom@live.com>
pkgname=pop-icon-theme-git
pkgver=3.5.0.r2504.3126c6a3f6
pkgrel=1
pkgdesc="System76 Pop icon theme"
arch=('any')
url="https://github.com/pop-os/icon-theme"
license=('CC-BY-SA-4.0 AND CC-BY-NC-SA-4.0')
depends=('adwaita-icon-theme')
makedepends=('git' 'dpkg''meson')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!strip')
source=('git+https://github.com/pop-os/icon-theme.git')
sha256sums=('SKIP')

pkgver() {
  cd icon-theme
  printf "%s.r%s.%s" "$(dpkg-parsechangelog --show-field Version | sed 's/1://;s/-/./')" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  arch-meson icon-theme build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"

  cd icon-theme
  install -Dm644 COPYING LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
