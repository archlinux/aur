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

pkgname=zz
pkgver=0.2.0
pkgrel=1
pkgdesc='ZZ programming language toolchain — prebuilt binary (zz run main.zz, plus zz-lsp)'
arch=('x86_64' 'aarch64')
url='https://github.com/zaidejjo/zz'
license=('Apache')
depends=('gcc-libs' 'curl' 'sqlite')
makedepends=('unzip')
conflicts=('zz-lang')
source_x86_64=("$pkgname-$pkgver-$CARCH.zip::https://github.com/zaidejjo/zz/releases/download/v$pkgver/zz-$pkgver-linux-x86_64.zip")
source_aarch64=("$pkgname-$pkgver-$CARCH.zip::https://github.com/zaidejjo/zz/releases/download/v$pkgver/zz-$pkgver-linux-aarch64.zip")
sha256sums_x86_64=('33f9def16420b9e1c49901f6538bac54252d60f689f23b678633abafccb3f374')
sha256sums_aarch64=('75dd99f6bcc20d250799d4f0f16c0f850fd6768d6b3d5e94b74574b867c7ffc1')

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
