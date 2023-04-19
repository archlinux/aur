# Maintainer: ObserverOfTime <chronobserver@disroot.org>

pkgname=owo-cli-git
pkgver=2.0.0+r290.gd6ffda9
pkgrel=1
pkgdesc="A bash based file uploader and URL shortener for owo.whats-th.is (git version)"
arch=('any')
url="https://whats-th.is"
license=('GPL3')
depends=('curl' 'grep' 'awk')
makedepends=('awk' 'git')
conflicts=('owo-cli')
provides=("owo-cli=${pkgver%+r*}")
source=('git+https://owo.codes/whats-this/owo.sh.git#branch=posixly-correct')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/owo.sh"
  printf '%s+r%s.g%s' \
    "$(awk -F\" '/^VERSION=/{print $2}' bin/owo)" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/owo.sh"
  install -Dm755 bin/owo "${pkgdir}/usr/bin/owo"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/owo-cli/LICENSE"
  install -Dm644 README.adoc "${pkgdir}/usr/share/doc/owo-cli/README.adoc"
  install -Dm644 share/man/man1/owo.1 "${pkgdir}/usr/share/man/man1/owo.1"
}
