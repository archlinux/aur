# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=nile-git
pkgver=r73.8f7ab26
pkgrel=1
pkgdesc="Unofficial Amazon Games client"
arch=('x86_64')
url="https://github.com/imLinguin/nile"
license=('GPL-3.0-or-later')
depends=(
  'python-json5'
  'python-platformdirs'
  'python-protobuf'
  'python-pycryptodome'
  'python-requests'
  'python-zstandard'
)
makedepends=('git' 'pyinstaller')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/imLinguin/nile.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname%-git}"
  pyinstaller --onefile --name "${pkgname%-git}" "${pkgname%-git}/cli.py"
}

package() {
  cd "${pkgname%-git}"
  install -Dm755 dist/${pkgname%-git} -t "$pkgdir/usr/bin/"
}
