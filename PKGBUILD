# Maintainer:  jyantis <yantis@yantis.net>

pkgname=tumbld-git
pkgver=r16.7c6a9ef
pkgrel=1
pkgdesc='A bash script to download all the images from a tumblr or set of tumblrs'
arch=('any')
url='https://github.com/nixterrimus/tumbld'
license=('MIT')
depends=('wget')
source=('git+https://github.com/nixterrimus/tumbld.git')
sha256sums=('SKIP')
makedepends=('git')
provides=('tumbld')
conflicts=('tumbld')

pkgver() {
  cd tumbld
  set -o pipefail
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd tumbld

  # We don't need anything related to git in the package
  rm -rf .git*

  # Install README as License since that is where it is
  install -D -m644 readme.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 readme.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  # Install the program
  install -D -m755 tumbld.sh "$pkgdir/usr/bin/tumbld"

}

# vim:set ts=2 sw=2 et:
