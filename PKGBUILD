pkgname=xtrayhide-git
pkgver=r2.5e33f36
pkgrel=1
pkgdesc="Capture X11(XEmbed) tray icons, forward them to SNI. For Wayland compositors(Niri,Hyprland)"
arch=('x86_64')
url="https://github.com/bnema/xtrayhide"
license=('MIT')
depends=('dbus' 'libx11')
makedepends=('go' 'git')
provides=('xtrayhide')
conflicts=()
source=("git+${url}.git"
        "${pkgname}.install")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "$srcdir/xtrayhide"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/xtrayhide"
  export GOPROXY=https://goproxy.cn,direct
  go build -trimpath -o xtrayhide ./cmd/xtrayhide
}

package() {
  cd "$srcdir/xtrayhide"
  install -Dm755 xtrayhide "${pkgdir}/usr/bin/xtrayhide"
  install -Dm644 xtrayhide.service "${pkgdir}/usr/lib/systemd/user/xtrayhide.service"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
