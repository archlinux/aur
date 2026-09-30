# Maintainer: zaidejjo
# AUR package for the ZZ programming language toolchain.
# Prebuilt upstream release zips — installs in seconds, no compilation.
# This file is generated from PKGBUILD.template by
# packaging/aur/render.sh (or .github/workflows/aur-publish.yml).
# Do NOT edit pkgver/sha256sums by hand — CI rewrites them on every
# GitHub Release. Edit the template instead.
#
# Installs:
#   /usr/bin/zz      -> `zz run main.zz`, `zz check`, `zz build`, REPL
#   /usr/bin/zz-lsp  -> language server

pkgname=zz-lang
pkgver=0.1.4
pkgrel=1
pkgdesc='ZZ programming language toolchain — prebuilt binary (zz run main.zz, plus zz-lsp)'
arch=('x86_64' 'aarch64')
url='https://github.com/zaidejjo/zz'
license=('Apache')
depends=('gcc-libs' 'curl' 'sqlite')
makedepends=('unzip')
conflicts=('zz')
source_x86_64=("$pkgname-$pkgver-x86_64.zip::https://github.com/zaidejjo/zz/releases/download/v$pkgver/zz-$pkgver-linux-x86_64.zip")
source_aarch64=("$pkgname-$pkgver-aarch64.zip::https://github.com/zaidejjo/zz/releases/download/v$pkgver/zz-$pkgver-linux-aarch64.zip")
sha256sums_x86_64=('e96ed93d25d2dbd38044164b5d3808e560f11307ce11ec15c53bce6b9b3849f2')
sha256sums_aarch64=('eb8150e5e43507b5bc9ec6357a53c50ef5ca98fbec109d6b19760bd7c2401559')

check() {
  # Prebuilt binaries: smoke-test only (full suite ran in CI pre-release).
  # zz-lsp is a stdio server with no --version flag — assert executable
  # instead of running it (would block on stdin).
  ./zz --version
  test -x ./zz-lsp
}

package() {
  install -Dm755 zz "$pkgdir/usr/bin/zz"
  install -Dm755 zz-lsp "$pkgdir/usr/bin/zz-lsp"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
