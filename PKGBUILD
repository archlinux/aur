# Maintainer:  Po-An,Yang(Antonio) <yanganto gmail.com>

set -u
pkgname='clipcat'
pkgver=0.5.0
pkgrel='2'
pkgdesc='Clipcat is a clipboard manager written in Rust Programming Language.'
arch=('any')
url='https://github.com/xrelkd/clipcat'
license=('GPL3')
depends=('libxcb' 'python' 'rust' 'protobuf' 'llvm' 'clang')
source=("${pkgname}.tgz::https://github.com/xrelkd/clipcat/archive/v${pkgver}.tar.gz")
sha256sums=('6fb974784485f475082e7ba19a4ddcf25d55f4555011e11205c9862d1c5253bb')

package() {
  set -u
  cd ${srcdir}/${pkgname}-${pkgver}
  cargo build --all-features --release
  install -Dm755 target/release/clipcatctl "$pkgdir/usr/bin/clipcatctl"
  install -Dm755 target/release/clipcatd "$pkgdir/usr/bin/clipcatd"
  install -Dm755 target/release/clipcat-menu "$pkgdir/usr/bin/clipcat-menu"
  install -Dm755 target/release/clipcat-notify "$pkgdir/usr/bin/clipcat-notify"

  mkdir -p $pkgdir/usr/share/zsh/site-functions/
  install -Dm644 completions/zsh/site-functions/* $pkgdir/usr/share/zsh/site-functions/

  mkdir -p $pkgdir/usr/share/bash-completion/completions/
  install -Dm644 completions/bash-completion/completions/* $pkgdir/usr/share/bash-completion/completions/

  mkdir -p $pkgdir/usr/share/fish/completions/
  install -Dm644 completions/fish/completions/* $pkgdir/usr/share/fish/completions/

  set +u
}
set +u
