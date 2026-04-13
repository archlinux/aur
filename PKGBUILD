# Maintainer: Seu Nome <seu@email>

pkgname=gpu-ratemeter-git
pkgver=0.1.0
pkgrel=1
pkgdesc="Simple GPU throughput / fill-rate benchmark tool from Mesa"
arch=('x86_64')
url="https://gitlab.freedesktop.org/mesa/gpu-ratemeter"
license=('MIT')

depends=('mesa' 'libdrm' 'vulkan-icd-loader')
makedepends=('git' 'meson' 'ninja' 'gcc' 'pkgconf')

source=("git+https://gitlab.freedesktop.org/mesa/gpu-ratemeter.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/gpu-ratemeter"
  git describe --tags --always | sed 's/^v//;s/-/+/g'
}

build() {
  cd "$srcdir/gpu-ratemeter"
  meson setup build
  meson compile -C build
}

package() {
  cd "$srcdir/gpu-ratemeter"

  install -Dm755 build/gpu-ratemeter "$pkgdir/usr/bin/gpu-ratemeter"

  # licença (se existir no repo)
  if [[ -f LICENSE ]]; then
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
}
