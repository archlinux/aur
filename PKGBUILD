# Maintainer: Mikołaj Baranowski <mikolajb@gmail.com>

# Create your own app at https://www.dropbox.com/developers/apps/create
# and execute makepkg as following:
# PERSONALAPPKEY=personal_app_key PERSONALAPPSECRET=personal_app_secret makepkg

pkgname=dbxcli
pkgver=2.0.6
pkgrel=1
pkgdesc='A command line client for Dropbox built using the Go SDK'
license=('Apache')
arch=('x86_64' 'i686')
url='https://github.com/dropbox/dbxcli'
depends=()
makedepends=('go')
ldflags=" -X github.com/dropbox/dbxcli/cmd.personalAppKey=${PERSONALAPPKEY}"
ldflags+=" -X github.com/dropbox/dbxcli/cmd.personalAppSecret=${PERSONALAPPSECRET}"

source=("https://github.com/dropbox/dbxcli/archive/v${pkgver}.zip")
sha256sums=('f1b3ba90fa33be71a741270718021e95e278e260cc0d8fa5b2c55de715dab525')

build() {
  msg2 'Compiling...'

  mkdir -p ${srcdir}/src/github.com/dropbox
  mv -f ${pkgname}-${pkgver} ${srcdir}/src/github.com/dropbox/${pkgname}
  GOPATH=${srcdir} go build \
      -ldflags="${ldflags}" \
      -o ${pkgname} github.com/dropbox/${pkgname}
}

package() {
  msg2 'Installing...'

  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
