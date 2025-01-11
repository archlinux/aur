# Maintainer: Dušan Mitrović <dusan@dusanmitrovic.rs>
pkgname=minidlna-scrobble
pkgver=1.0.0
pkgrel=1
pkgdesc="Scrobble minidlna plays to last.fm"
arch=('x86_64' 'arm' 'aarch64')
url="https://github.com/dusnm/minidlna-scrobble"
_pkgurl="https://packages.t0.rs/minidlna-scrobble"
license=('GPL3')
depends=()
makedepends=('go>=1.23')
source=(
    "${pkgname}-${pkgver}.tar.gz::${_pkgurl}/v${pkgver}.tar.gz"
    "${pkgname}-${pkgver}.tar.gz.sig::${_pkgurl}/v${pkgver}.tar.gz.sig"
)
sha256sums=(
    "2d0d4f2f5f70f80c31ee8a7285b1763c9db2f011c7426cda839de2f648ebcaeb"
    "834866828d8938a330e04f7006f2dbb82b3a4774912615514523204bcf785106"
)
validpgpkeys=(
    # Get the key by running this command
    # gpg --recv-keys --keyserver=hkps://keys.openpgp.org 31086781B8FA9BA0EBDA9914C303EE480C188527
    "31086781B8FA9BA0EBDA9914C303EE480C188527"
)

build() {
  export GOPATH="$srcdir"/gopath
  export CGO_ENABLED=0

  cd "$srcdir/${pkgname}-${pkgver}"

  go build -mod=readonly -modcacherw -ldflags "-s -w -extldflags='-static'" .
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  _output="${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 "${_output}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
