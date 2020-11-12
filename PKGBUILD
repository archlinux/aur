# Maintainer:  Po-An,Yang(Antonio) <yanganto gmail.com>

set -u
pkgname='clipcat'
pkgver=0.4.19
pkgrel='1'
pkgdesc='Clipcat is a clipboard manager written in Rust Programming Language.'
arch=('any')
url='https://github.com/xrelkd/clipcat'
license=('GPL3')
depends=('libxcb' 'python' 'rust' 'protobuf')
source=("${pkgname}.tgz::https://github.com/xrelkd/clipcat/archive/v${pkgver}.tar.gz")
sha256sums=('cfaffc69ec8aa3050c5d46e7ddffec96481d4ba0d0f528f38db11691161b096d')

package() {
  set -u
  cd ${srcdir}/${pkgname}-${pkgver}
  cargo build --all-features --release
  install -Dm755 target/release/clipcatctl "$pkgdir/usr/bin/clipcatctl"
  install -Dm755 target/release/clipcatd "$pkgdir/usr/bin/clipcatd"
  install -Dm755 target/release/clipcat-menu "$pkgdir/usr/bin/clipcat-menu"
  install -Dm755 target/release/clipcat-notify "$pkgdir/usr/bin/clipcat-notify"

  install -Dm644 completions/zsh/site-functions/_clipcatd "$pkgdir/usr/share/zsh/site-functions/_clipcatd"
  install -Dm644 completions/zsh/site-functions/_clipcatctl "$pkgdir/usr/share/zsh/site-functions/_clipcatctl"
  install -Dm644 completions/zsh/site-functions/_clipcat-menu "$pkgdir/usr/share/zsh/site-functions/_clipcat-menu"
  install -Dm644 completions/zsh/site-functions/_clipcat-notify "$pkgdir/usr/share/zsh/site-functions/_clipcat-notify"
  
  install -Dm644 completions/bash-completion/completions/clipcatd "$pkgdir/usr/share/bash-completion/completions/clipcatd"
  install -Dm644 completions/bash-completion/completions/clipcatctl "$pkgdir/usr/share/bash-completion/completions/clipcatctl"
  install -Dm644 completions/bash-completion/completions/clipcat-menu "$pkgdir/usr/share/bash-completion/completions/clipcat-menu"
  install -Dm644 completions/bash-completion/completions/clipcat-notify "$pkgdir/usr/share/bash-completion/completions/clipcat-notify"
  
  install -Dm644 completions/fish/completions/clipcatd.fish "$pkgdir/usr/share/bash-completion/completions/clipcatd.fish"
  install -Dm644 completions/fish/completions/clipcatctl.fish "$pkgdir/usr/share/bash-completion/completions/clipcatctl.fish"
  install -Dm644 completions/fish/completions/clipcat-menu.fish "$pkgdir/usr/share/bash-completion/completions/clipcat-menu.fish"
  install -Dm644 completions/fish/completions/clipcat-notify.fish "$pkgdir/usr/share/bash-completion/completions/clipcat-notify.fish"

  set +u
}
set +u
