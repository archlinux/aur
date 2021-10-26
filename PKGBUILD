# Maintainer: lmbbrkr <lmbbrkr at protonmail dot ch>

pkgname=nift
_pkgname=nsm
pkgver=2.4.12
pkgrel=1
pkgdesc="World's fastest cross-platform open source website generator."
arch=('x86_64')
url="https://nift.dev"
license=('MIT')
depends=('gcc-libs' 'glibc')
provides=('nsm')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/nifty-site-manager/${_pkgname}/archive/v${pkgver}.tar.gz"
        'nift-2.4.12.patch')
sha256sums=('7a28987114cd5e4717b31a96840c0be505d58a07e20dcf26b25add7dbdf2668b'
            '9ff22393d9c81db2f17ca629ab6170bbfebbaa0ecaaf73688112cab335644753')

prepare() {
  cd "${_pkgname}-${pkgver}"
  ## https://data.gpo.zugaina.org/NuLL3rr0r/www-apps/nift/files/nift-2.4.12.patch
  patch -Np1 -i "${srcdir}/nift-2.4.12.patch"
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
