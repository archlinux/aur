# Maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)
# Contributor : stoneo

pkgname=rdcli-git
pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf '%s.r%s.%s' \
    "$(git tag -l | grep -P '.+\..+\.\d+' | sed -r 's/v?([0-9\.]+)(-.+)?/\1/g' | sort -Vr | sed 1q)" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgver=1.5.1.r121.d7b64c1
pkgrel=1

pkgdesc="A simple CLI tool to unrestrict links with real-debrid.com"
arch=('any')
url="https://github.com/stoneo/rdcli"
license=('GPL3')

provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
depends=('nodejs')
makedepends=('git' 'npm')

#noextract=("$pkgname-${pkgver%-git}.tgz")

source=("${pkgname%-git}::git+https://github.com/ston3o/${pkgname%-git}")
sha256sums=('SKIP')

package() {
  cd "${pkgname%-git}"
  npm install -g --user root --prefix "$pkgdir/usr" "${pkgname%-git}"
}

# vim: ts=2 sw=2 et ft=PKGBUILD:
