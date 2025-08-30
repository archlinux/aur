# Maintainer: Christian <37947442+OfficialKris@users.noreply.github.com>
pkgname=dowm-git
pkgver=r129.d73b7ec
pkgrel=1
pkgdesc="A beautiful window manager for x11"
arch=(x86_64)
url="https://github.com/BobdaProgrammer/doWM"
license=(MIT)
optdepends=(xorg-server xlibre-server)
makedepends=(git go)
provides=(dowm)
conflicts=(dowm)
source=(git+$url)
md5sums=('SKIP')
_gitname="doWM"

pkgver() {
  cd "${srcdir}/${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_gitname}"

  CGO_ENABLED=0 go build \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -trimpath \
    -ldflags="-bindnow" \
    -o doWM
}

package() {
  cd "${srcdir}/${_gitname}"

  # binary
  install -vDm755 "doWM" "$pkgdir/usr/local/bin/doWM"
  
  # xsession listing
  install -vDm644 "doWM.desktop" "$pkgdir/usr/share/xsessions/doWM.desktop"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  
  #TODO: install config
}
