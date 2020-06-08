# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=tamgamp.lv2
pkgname="${_pkgname}-git"
pkgver=r12.590ced0
pkgrel=1
pkgdesc="A guitar pre-amp simulator LV2 plugin (git version)"
arch=('x86_64')
url="https://github.com/sadko4u/tamgamp.lv2"
license=('GPL3')
groups=('lv2-plugins' 'pro-audio')
depends=('zita-resampler')
makedepends=('git' 'lv2')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/sadko4u/${_pkgname}.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  # no release version or version number in the sources anywhere yet
  #local ver="$(cat VERSION)"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  make PREFIX=/usr
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" PREFIX=/usr install
  install -vDm 644 AUTHORS README.md \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
