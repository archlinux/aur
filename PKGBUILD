# Maintainer: Jeremy Kescher <jeremy@kescher.at>
_pkgname=oggify
pkgname=${_pkgname}-git
pkgver=0.2.1.r0.gce3e875
pkgrel=1
pkgdesc="Download spotify media (Premium account required)"
arch=('i686' 'x86_64')
url="https://github.com/kescherCode/oggify"
license=('MIT')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
makedepends=(git rust)
optdepends=('vorbis-tools: for included tag_ogg script')
source=(${_pkgname}::git+https://github.com/kescherCode/${_pkgname}.git)
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"
  cargo build --release
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm755 target/release/oggify "$pkgdir/usr/bin/oggify"
  install -Dm755 tag_ogg "$pkgdir/usr/share/oggify/tag_ogg"
}

