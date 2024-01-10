# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='fuc-bin'
pkgver=2.0.0
pkgrel=1
pkgdesc='Fast Unix Commands: Modern, performance focused unix commands (pre-compiled)'
arch=('aarch64' 'x86_64')
url='https://github.com/SUPERCILEX/fuc'
license=('Apache')
provides=('cpz' 'fuc' 'rmz')
conflicts=('cpz' 'fuc' 'rmz' 'fuc-static-musl-bin')
replaces=('fuc-static-musl-bin')
_readme='https://raw.githubusercontent.com/SUPERCILEX/fuc/master/README.md'
source_aarch64=(
  "cpz-aarch64-$pkgver::$url/releases/download/$pkgver/cpz-aarch64-unknown-linux-gnu"
  "rmz-aarch64-$pkgver::$url/releases/download/$pkgver/rmz-aarch64-unknown-linux-gnu"
  "$_readme"
)
source_x86_64=(
  "cpz-x86_64-$pkgver::$url/releases/download/$pkgver/cpz-x86_64-unknown-linux-gnu"
  "rmz-x86_64-$pkgver::$url/releases/download/$pkgver/rmz-x86_64-unknown-linux-gnu"
  "$_readme"
)
noextract=(
  "cpz-$CARCH-$pkgver"
  "rmz-$CARCH-$pkgver"
)
depends=('gcc-libs' 'glibc')

package() {
  # Be more verbose if standard output is a TTY
  test -t 1 && _verbose='v' || _verbose=''

  for _exe in cpz rmz; do
    install "-${_verbose}Dm0755" "$_exe-$CARCH-$pkgver" "$pkgdir/usr/bin/$_exe"
  done

  install "-${_verbose}Dm0644" "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}

sha256sums_aarch64=(
  'bbc391228552df08c75ae2ecee1c3c9c236967b199625e92b1f8081114418db2'
  '9a581b99da4c86103215be4ed19fdeb6e65cd609fed1bd20d92bc65e72577079'
  'SKIP'
)
sha256sums_x86_64=(
  'f59e768ea8a095bf9fb93a36ecdf55071f9e6dd36111411408318f72ed205c8d'
  '97ee90c8875e8948595119b3a4b1b4ff339a915d31d0cb51aa52c32eb49361be'
  'SKIP'
)

# eof
