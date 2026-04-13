# Maintainer: Seu Nome <seu@email>

pkgname=gpu-ratemeter-git
pkgver=20260413
pkgrel=1
pkgdesc="Simple GPU throughput / fill-rate benchmark tool from Mesa"
arch=('x86_64')
url="https://gitlab.freedesktop.org/mesa/gpu-ratemeter"
license=('MIT')

depends=('mesa' 'libdrm' 'vulkan-icd-loader')
makedepends=('meson' 'ninja' 'gcc' 'pkgconf')

source=("https://gitlab.freedesktop.org/mesa/gpu-ratemeter/-/archive/main/gpu-ratemeter-main.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/gpu-ratemeter-main"
  meson setup build --buildtype=release
  meson compile -C build
}

package() {
  cd "$srcdir/gpu-ratemeter-main"

  install -Dm755 build/gpu-ratemeter "$pkgdir/usr/bin/gpu-ratemeter"

  [[ -f LICENSE ]] && install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
