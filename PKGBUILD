# Maintainer: Vasia Novikov <n1dr+cmarchlinux@yaaandex.com> (replace "aaa" with "a")

pkgname=rua
pkgver=0.13.8
pkgrel=1
pkgdesc='secure AUR helper written in Rust'
url='https://github.com/vn971/rua'
source=("https://github.com/vn971/rua/archive/${pkgver}.tar.gz")
arch=('x86_64' 'i686')
license=('GPL3')
makedepends=('cargo')
depends=('bubblewrap' 'git')

#options+=(!strip)  # uncomment to have readable stack traces

sha256sums=(71953f13c688701145286bb274ac1e8a278fda14a34dbcb2d855162c962a7fce)

build () {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p target/completions
  RUSTUP_TOOLCHAIN=stable \
    COMPLETIONS_DIR=target/completions \
    cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 target/release/rua "${pkgdir}/usr/bin/rua"

  install -Dm644 target/completions/rua.bash "${pkgdir}/usr/share/bash-completion/completions/rua.bash"
  install -Dm644 target/completions/rua.fish "${pkgdir}/usr/share/fish/completions/rua.fish"
  install -Dm644 target/completions/_rua "${pkgdir}/usr/share/zsh/functions/Completion/Linux/_rua"
}
