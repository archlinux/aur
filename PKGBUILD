pkgname=hpaper
pkgver=0.7.2
pkgrel=1
pkgdesc='Advanced Wallpaper Management for Wayland'
arch=('x86_64')
url="https://github.com/Hcode00/hpaper"
license=('GPL')
makedepends=('go')
optdepends=('swaybg: Wallpaper utility for Wayland compositors.'
            'hyprpaper: a blazing fast wayland wallpaper utility with IPC controls.'
            'python-pywal16: Generate and change color-schemes on the fly.')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v0.7.2.tar.gz")
sha256sums=('d3a54a1ae4473f9c1fc622ce661d5e629247505de9504fbfb652bb0384f46f10')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -o hpaper .
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 hpaper "${pkgdir}/usr/bin/hpaper"
}
