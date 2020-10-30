# Maintainer: orhun <orhunparmaksiz@gmail.com>
# Contributor: spikecodes <19519553+spikecodes@users.noreply.github.com>
# https://github.com/orhun/pkgbuilds

pkgname=sic-git # TODO: rename it to sic-image-cli-git
_newname=sic-image-cli-git
_pkgname=sic
pkgver=0.14.0.r0.g9c0e31f
pkgrel=1
pkgdesc="Accessible image processing and conversion from the terminal (git)"
arch=('x86_64')
url="https://github.com/foresterre/sic"
license=('MIT')
makedepends=('cargo' 'git')
conflicts=("${_newname%-git}" "${_newname%-git}-bin")
provides=("${_newname%-git}")
source=("git+${url}")
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags $(git rev-list --tags --max-count=1) | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  cargo build --release --locked --all-features
}

package() {
  cd "$_pkgname"
  install -Dm 755 "target/release/$_pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm 644 LICENSE-MIT -t "$pkgdir/usr/share/licenses/$_pkgname"
}
