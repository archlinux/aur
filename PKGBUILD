# Maintainer: Butter Cat <ButteredCats@protonmail.com>

_pkgname="intellectual"
pkgname="${_pkgname}-git"
pkgver=r376.aa4ffb2
pkgrel=1
pkgdesc="An alternative frontend for Genius focused on privacy and simplicity."
arch=('x86_64' 'aarch64')
url="https://github.com/Insprill/intellectual"
license=('AGPL-3.0-only')
makedepends=('git' 'rust')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}")
sha256sums=('SKIP')
backup=('etc/intellectual.conf')
options=('!buildflags')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${_pkgname}"
  cargo build --release
}

package() {
  cd "${_pkgname}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dm644 ../../intellectual.conf -t "${pkgdir}/etc/"
  install -Dm644 ../../intellectual.service -t "${pkgdir}/usr/lib/systemd/system/"
  install -Dm755 "target/release/intellectual" "${pkgdir}/usr/bin/"
}
