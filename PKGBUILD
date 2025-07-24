pkgname=hpaper
pkgver=0.5
pkgrel=2
pkgdesc='Automated Wallpaper Management for Wayland Using Swaybg'
arch=('x86_64')
url="https://github.com/Hcode00/hpaper"
license=('GPL')
makedepends=('go')
optdepends=('swaybg: Backend for wlroots-based compositors (Sway, river, etc.)'
           'hyprpaper: Backend for Hyprland window manager')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v0.5.tar.gz")
sha256sums=('1194e76e1cf4b3decc5766c59ed6b526a8ea580c86920a8ba928f6e5ab2816f4')

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
