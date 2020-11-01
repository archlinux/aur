# Maintainer: lmbbrkr <lmbbrkr at protonmail dot ch>

pkgname=nift
_pkgname=nsm
pkgver=2.3.10
pkgrel=1
pkgdesc="World's fastest cross-platform open source website generator."
arch=('x86_64')
url="https://nift.dev"
license=('MIT')
depends=('gcc-libs' 'glibc')
provides=('nsm')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/nifty-site-manager/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('ef4410d423fca8dfb67a349a188a0a46bec67f7eb0157d146ae2fbb28f2f2295')

prepare() {
  cd "${_pkgname}-${pkgver}"
  sed -i 's|PREFIX?=/usr/local|PREFIX?=/usr|g; s|cp nsm nift|cp -l nsm nift|g' Makefile
}

build() {
  cd "${_pkgname}-${pkgver}"
  make all
}

package() {
  cd "${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

# vim:set ts=2 sw=2 et:
