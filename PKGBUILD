pkgname=hpaper
pkgver=0.6
pkgrel=2
pkgdesc='Advanced Wallpaper Management for Wayland'
arch=('x86_64')
url="https://github.com/Hcode00/hpaper"
license=('GPL')
makedepends=('go')
optdepends=('swaybg: Wallpaper utility for Wayland compositors.'
            'hyprpaper: a blazing fast wayland wallpaper utility with IPC controls.'
            'python-pywal16: Generate and change color-schemes on the fly.')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v0.6.tar.gz")
sha256sums=('e05be980279c1943e2514d8f82f946e9c450723147fa06dc7651b06c7395e1e8')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  rm -f showcase.gif || true
}

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
