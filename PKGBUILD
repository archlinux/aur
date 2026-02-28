pkgname=trinity-cli
pkgver=1.0.1
pkgrel=1
pkgdesc="Sacred Intelligence CLI — Trinity v1.0.1 PURITY"
arch=('x86_64' 'aarch64')
url="https://github.com/gHashTag/trinity"
license=('MIT')
depends=()
makedepends=('zig')
source=("https://github.com/gHashTag/trinity/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/trinity-${pkgver}"
  zig build -Doptimize=ReleaseFast tri
}

package() {
  cd "${srcdir}/trinity-${pkgver}"
  install -Dm755 zig-out/bin/tri "${pkgdir}/usr/bin/tri"
  
  # Shell completions (need to be generated)
  install -Dm644 completions/bash/tri.bash "${pkgdir}/usr/share/bash-completion/completions/tri" || true
  install -Dm644 completions/zsh/_tri "${pkgdir}/usr/share/zsh/site-functions/_tri" || true
  install -Dm644 completions/fish/tri.fish "${pkgdir}/usr/share/fish/vendor_completions.d/tri.fish" || true
}
