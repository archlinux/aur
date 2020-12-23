# Maintainer: Mikołaj Baranowski <mikolajb@gmail.com>

pkgname=wallpaper-switch
pkgver=0.5
pkgrel=1
pkgdesc='Runs in backgroud and changes Gnome backgroud to NASA picture of the day.'
license=('MIT')
arch=('x86_64' 'i686')
url='https://github.com/mikolajb/wallpaper-switch'
depends=()
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mikolajb/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('43543cd2822782a73ff3a69ce5ce1f6610e070ed386f7c6ad1a3abe461b3df68')

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o wallpaper-switch .
}

package() {
  msg2 'Installing...'

  install -Dm755 ${srcdir}/${pkgname}-${pkgver}/wallpaper-switch ${pkgdir}/usr/bin/wallpaper-switch
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/wallpaper-switch.service ${pkgdir}/usr/lib/systemd/user/wallpaper-switch.service
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/wallpaper-switch.timer ${pkgdir}/usr/lib/systemd/user/wallpaper-switch.timer
}
