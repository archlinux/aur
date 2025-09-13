pkgname=hpaper
pkgver=0.6.1
pkgrel=1
pkgdesc='Advanced Wallpaper Management for Wayland'
arch=('x86_64')
url="https://github.com/Hcode00/hpaper"
license=('GPL')
makedepends=('go')
optdepends=('swaybg: Wallpaper utility for Wayland compositors.'
            'hyprpaper: a blazing fast wayland wallpaper utility with IPC controls.'
            'python-pywal16: Generate and change color-schemes on the fly.')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v0.6.1.tar.gz")
sha256sums=('097a2a0afc46f03245d94e49d279596e92e6c5a500cdb31baf1d958727ceb4c0')

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
