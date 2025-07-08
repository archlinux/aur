# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-arch-update-security-news-git
pkgver=2.rc1.r0.g83b1a75
pkgrel=2
pkgdesc="Update indicator for ArchLinux and Gnome-Shell"
arch=('any')
url="https://github.com/slaclau/arch-update-security-news"
license=('GPL-3.0-or-later')
depends=(
  'arch-audit'
  'gnome-shell'
  'pacman-contrib'
  'xdg-utils'
)
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'gnome-shell-extension-arch-update')
source=('git+https://github.com/slaclau/arch-update-security-news.git')
sha256sums=('SKIP')

pkgver() {
  cd arch-update-security-news
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd arch-update-security-news
  make _build
}

package() {
  cd arch-update-security-news
  make DESTDIR="$pkgdir" install
}
