# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=jack_capture
pkgname="${_pkgname}-git"
pkgver=0.9.73.r163.472b13e
pkgrel=1
pkgdesc="Simple command line tool to record JACK audio output to a file (git version)"
arch=('i686' 'x86_64')
url="https://github.com/kmatheussen/jack_capture"
license=('GPL')
groups=('pro-audio')
depends=('jack' 'lame' 'liblo' 'libsndfile')
makedepends=('git')
optdepends=('meterbridge: levels monitor'
            'zenity: gtk2 gui')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/kmatheussen/${_pkgname}.git")
md5sums=('SKIP')


pkgver() {
  cd "${srcdir}/${_pkgname}"

  local ver="$(grep ^VERSION= Makefile | cut -f 2 -d =)"
  echo "$ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"

  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  make PREFIX='/usr' DESTDIR="${pkgdir}" install
  # gtk2 gui
  install -Dm 755 "${_pkgname}_gui" "${pkgdir}/usr/bin/${_pkgname}_gui"
  # doc
  install -Dm 644 README -t "${pkgdir}/usr/share/doc/${pkgname}"
}
# vim:set ts=2 sw=2 et:
