# Maintainer:  jyantis <yantis@yantis.net>

pkgname=lsn-git
pkgver=r2.0591a39
pkgrel=1
pkgdesc='4DOS-inspired ls with file/dir descriptions for organized Linux CLI use.'
arch=('any')
url='https://github.com/yantis/lsn'
license=('MIT')
depends=('coreutils')
source=('git+https://github.com/yantis/lsn.git')
sha256sums=('SKIP')
makedepends=('git')
provides=('lsn-git')
conflicts=('lsn-git')

pkgver() {
  cd lsn
  set -o pipefail
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd lsn
  make
}

package() {
  cd lsn

  # We don't need anything related to git in the package
  rm -rf .git*

  # Install LICENSE
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  # Install the program
  install -D -m755 lsn "$pkgdir/usr/bin/lsn"

}

# vim:set ts=2 sw=2 et:
