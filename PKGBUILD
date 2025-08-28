# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=keymaker
pkgver=1.1.0
pkgrel=2
pkgdesc="A central hub for managing all your SSH keys."
arch=('any')
url="https://github.com/tobagin/keymaker"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'libadwaita'
  'openssh'
  'python-annotated-types'
  'python-dotenv'
  'python-gobject'
  'python-pexpect'
  'python-pydantic'
  'python-pydantic-core'
  'python-typing_extensions'
  'python-typing-inspection'
)
makedepends=(
  'blueprint-compiler'
  'meson'
)
checkdepends=(
  'appstream-glib'
#  'python-pytest'
#  'xorg-server-xvfb'
)
optdepends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7fef6aa0714890f133fa676b05494f95a64d2b181190f935e56399e4b6480373')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs || :

  cd "$pkgname-$pkgver"
#  xvfb-run pytest  ## TODO
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
