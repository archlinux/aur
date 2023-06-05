# Maintainer: Maarten de Boer <info@maartendeboer.net>
pkgname=forge-sparks
pkgver=0.1.1
pkgrel=1
pkgdesc='Simple notifier app with support for Github, Gitea and Forgejo'
arch=('x86_64' 'aarch64')
url='https://github.com/rafaelmardojai/forge-sparks'
license=('MIT')
depends=('gjs>=1.72' 'gtk4>=4.10' 'libadwaita>=1.3.0' 'libsoup3>=3.0' 'libsecret>=0.20' 'libportal>=0.6' 'hicolor-icon-theme' 'dconf')
makedepends=('git' 'meson' 'ninja')
source=("forge-sparks-${pkgver}::git+https://github.com/rafaelmardojai/forge-sparks.git#tag=${pkgver}")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname-$pkgver"
  git submodule init
  git submodule update
}

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"

  cd "$pkgname-$pkgver"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
