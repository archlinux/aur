# Maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)

pkgname=reddio-git
pkgver() {
  cd "${pkgname%-git}"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgver=r134.66c12ce
pkgrel=1

pkgdesc='A command-line interface for Reddit written in POSIX sh'
arch=('any')
url='https://gitlab.com/aaronNG/reddio'
license=('custom:MIT')

provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

depends=('curl' 'jq')
optdepends=('gnu-netcat: authenticate with your Reddit account credentials'
            'openbsd-netcat: authenticate with your Reddit account credentials')
makedepends=('git')

changelog=ISSUES
source=("git+$url")
sha256sums=('SKIP')

prepare() {
  cd "${pkgname%-git}"
  # Arch packages are never ever installed to /usr/local/
  sed -i 's|/usr/local/|/usr/|g' "${pkgname%-git}"
}

package() {
  cd "${pkgname%-git}"
  make PREFIX="$pkgdir/usr" install
  install -Dm644 README.md ISSUES example.png -t"$pkgdir/usr/share/doc/${pkgname%-git}/"
  install -Dm644 LICENSE -t"$pkgdir/usr/share/licenses/${pkgname%-git}/"
}

# vim: ts=2 sw=2 et ft=PKGBUILD:
