# Maintainer: t4k44 <95964+t4k44@users.noreply.github.com>

_pkgname=wl-find-cursor
pkgname=${_pkgname}-git
pkgver=0.0.0.r52.ce1a125 # makepkg 時に自動更新されます
pkgrel=1
epoch=
pkgdesc="highlight and print out global mouse position in wayland"
arch=('x86_64' 'aarch64')
url="https://github.com/cjacker/wl-find-cursor"
license=('MIT')
depends=('wayland') 
makedepends=('git' 'wayland-protocols') 
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "0.0.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  echo "Starting build() in dir: ${srcdir}/${_pkgname}"
  cd "${srcdir}/${_pkgname}"

  echo "Running 'make' to compile binary..."
  make
}

package() {
  echo "Starting package() - Target pkgdir: ${pkgdir}"
  cd "${srcdir}/${_pkgname}"

  echo "Installing binary to ${pkgdir}/usr/bin/"
  install -Dm755 wl-find-cursor "${pkgdir}/usr/bin/wl-find-cursor"

  echo "Installing license to ${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  echo "package() completed successfully."
}
