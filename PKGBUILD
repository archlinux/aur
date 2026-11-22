# Maintainer: Francesco Cherchi <frnchr.d9var@slmail.me>

pkgname=xdgmenumaker-git
pkgver=2.6.r0.ga1fcf59
pkgrel=1
pkgdesc="A command line tool that generates XDG menus for several window managers"
url="https://github.com/gapan/${pkgname%-git}"
arch=('any')
license=('GPL-3.0-only')
depends=('python-pyxdg' 'python-gobject' 'gtk3')
makedepends=('git')
optdepends=('txt2tags: for manpages' 'python-pillow: for restricting icon size')
provides=("${pkgname%-git}=${pkgver}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}"
  make
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR="$pkgdir/" PREFIX="/usr" install
}

