# Maintainer: csmantle <aur at csmantle dot top>

_exename=cc-switch
_pkgname="$_exename"-cli
pkgname="$_pkgname"-git
pkgver=5.4.0.r3.g49b7142
pkgrel=1
pkgdesc='All-in-One Assistant for Claude Code, Codex, Gemini, OpenCode & OpenClaw'
arch=('x86_64' 'aarch64' 'loong64')
url='https://github.com/SaladDay/cc-switch-cli'
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'git' 'rust')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_exename")
source=('git+https://github.com/SaladDay/cc-switch-cli.git')
sha256sums=('SKIP')
options=('!lto')

pkgver() {
  cd "$srcdir"/cc-switch-cli
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir"/cc-switch-cli/src-tauri
  cargo build --release --locked
}

check() {
  cd "$srcdir"/cc-switch-cli/src-tauri
  cargo test --locked
}

package() {
  cd "$srcdir"/cc-switch-cli/src-tauri

  install -vDm755 target/release/cc-switch "$pkgdir"/usr/bin/cc-switch
  install -vDm644 ../README.md "$pkgdir"/usr/share/doc/"$_pkgname"/README.md
  install -vDm644 ../README_ZH.md "$pkgdir"/usr/share/doc/"$_pkgname"/README_ZH.md
  install -vDm644 ../LICENSE "$pkgdir"/usr/share/licenses/"$_pkgname"/LICENSE
}
