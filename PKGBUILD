# Maintainer: asyync1024 <asyync1024 at proton dot me>
# Contributor: Josip Ponjavic <josipponjavic at gmail dot com>

_pkgname=fastcompmgr
pkgname=${_pkgname}-git
pkgver=0.5.r20.ga449edb
pkgrel=1
pkgdesc="An early Compton-based compositor for X11 focused on performance. (git)"
arch=('x86_64')
url="https://github.com/tycho-kirchner/${_pkgname}"
license=('MIT')
depends=('glibc' 'libx11' 'libxcomposite' 'libxdamage' 'libxfixes' 'libxrender')
makedepends=('git')
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("git+${url}.git")
sha256sums=('SKIP')

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
