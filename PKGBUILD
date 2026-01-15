# Maintainer: LinuxLover471 <LinuxLover471 at proton dot me>

_pkgname=fastcompmgr
pkgname=${_pkgname}-dev
pkgver=0.5.r18.gc9b8c3b
pkgrel=2
pkgdesc="An early Compton-based compositor for X11 focused on performance. (dev branch)"
arch=('x86_64')
url="https://github.com/tycho-kirchner/${_pkgname}"
license=('MIT')
makedepends=('git')
depends=(
  libx11
  libxcomposite
  libxdamage
  libxfixes
  libxrender
)
source=("git+${url}#branch=dev")
sha512sums=('SKIP')
conflicts=(${_pkgname})
provides=(${_pkgname})

pkgver() {
  cd ${_pkgname}
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//g'
}

build() {
  cd ${_pkgname}
  make
}

package() {
  cd ${_pkgname}

  install -Dm755 ${_pkgname} -t \
    "${pkgdir}/usr/bin/"

  install -Dm644 ${_pkgname}.1 -t \
    "${pkgdir}/usr/share/man/man1/"

  install -Dm644 LICENSE -t \
    "${pkgdir}/usr/share/licenses/${pkgname}/"
}
