# Maintainer: Jiri Tyr <jiri.tyr@gmail.com>

_pkgname=tempreader
pkgname="${_pkgname}-git"
pkgver=r1.c5900e3
pkgrel=3
pkgdesc='RESTful API to read data from DS18B20 temperature sensors.'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
url="https://github.com/${_pkgname}/"
license=('MIT')
makedepends=('go' 'git')
backup=("etc/default/${_pkgname}")
options=('!strip' '!emptydirs')
source=(
  "https://github.com/jtyr/${_pkgname}/archive/master.tar.gz"
  "${_pkgname}.service"
  "${_pkgname}.default")
sha256sums=(
  'SKIP'
  '2b6666d49bb73f82404aa8602d6505a2d0e84e223dea3f3cb1f6e9e9c79b072c'
  '13d5eb78950e0739abacb2a617ced6940965161972763b11e3f2a64614a99e00')

build() {
  cd "${_pkgname}-master/${_pkgname}"

  GOPATH="$srcdir" go get github.com/gorilla/mux
  GOPATH="$srcdir" go build
}

package() {
  cd "${_pkgname}-master"

  install -Dm755 "${_pkgname}/${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$startdir/${_pkgname}.service" "$pkgdir/usr/lib/systemd/system/${_pkgname}.service"
  install -Dm644 "$startdir/${_pkgname}.default" "$pkgdir/etc/default/${_pkgname}"
}

# vim:set ts=2 sw=2 et:
