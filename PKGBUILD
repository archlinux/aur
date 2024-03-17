# Maintainer: Frederik “Freso” S. Olesen <archlinux@freso.dk>
pkgname=makepkg-tidy-optipng-git
pkgver=r9.916da22
pkgrel=1
pkgdesc='Optimise PNG image sizes during packaging via a makepkg tidy script for optipng.'
arch=('any')
url="https://gitlab.archlinux.org/freso/${pkgname%-git}"
license=('GPL-2.0-or-later')
makedepends=('git' 'coreutils')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'makepkg-tidy-scripts')
backup=('etc/makepkg.conf.d/optipng.conf')
source=("git+${url}.git")
b2sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  depends=('optipng' 'pacman')
  install -Dm755 "${pkgname%-git}"/optipng.sh "$pkgdir"/usr/share/makepkg/tidy/optipng.sh
  install -Dm644 "${pkgname%-git}"/optipng.conf "$pkgdir"/etc/makepkg.conf.d/optipng.conf
}
