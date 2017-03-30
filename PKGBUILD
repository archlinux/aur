# Maintainer: Daniel Hillenbrand <codeworkx at bbqlinux dot org>

_pkgbase=it87
pkgname=it87-dkms-git
pkgver=59.75fdbbc
pkgrel=1
pkgdesc=""
arch=('x86_64' 'i686')
url="https://github.com/groeck/it87"
license=('GPL')
depends=('dkms')
provides=('it87')

source=("$_pkgbase::git+https://github.com/groeck/it87.git"
        "dkms.conf")

sha256sums=('SKIP'
            'b6feb5228fe1183b61b7428d4dbbf4f63cc2c951d5980f17d0174a95a995e670')

pkgver() {
  cd "$srcdir/$_pkgbase"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgbase"
}

package() {
  cd "$srcdir/$_pkgbase"
  install -Dm644 ${srcdir}/dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
    -e "s/@PKGVER@/${pkgver}/" \
    -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
  cp -r ${srcdir}/${_pkgbase}/* "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
}
