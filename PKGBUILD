# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=nile-git
pkgver=r54.61ea662
pkgrel=1
pkgdesc="Unofficial Amazon Games client"
arch=('any')
url="https://github.com/imLinguin/nile"
license=('GPL3')
depends=('bash' 'python-json5' 'python-protobuf' 'python-pycryptodome'
         'python-requests' 'python-zstandard')
makedepends=('git' 'pyinstaller')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/imLinguin/nile.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  pyinstaller --onefile --name "${pkgname%-git}" "${pkgname%-git}/cli.py"
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -Dm755 dist/${pkgname%-git} -t "$pkgdir/usr/bin/"
}
