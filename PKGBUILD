# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='fuc-bin'
pkgver=2.1.0
pkgrel=1
pkgdesc='Fast Unix Commands: Modern, performance focused unix commands (pre-compiled)'
arch=('aarch64' 'x86_64')
url='https://github.com/SUPERCILEX/fuc'
license=('Apache-2.0')  # SPDX-License-Identifier: Apache-2.0
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
  test -t 1 && _v='v' || _v=''

  for _exe in cpz rmz; do
    install "-${_v}Dm0755" "$_exe-$CARCH-$pkgver" "$pkgdir/usr/bin/$_exe"
  done

  install "-${_v}Dm0644" "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}

sha256sums_aarch64=(
  '0049d31616d48d0aa0fffe89431d0f2ff7051dd4f42a65e7bdbb762b4a57f897'
  '09fd21d290dedb9883ac4608631a6373542b74fe7b1d002ea1c03e8b8a19a973'
  'SKIP'
)
sha256sums_x86_64=(
  'f86b5213f6fc636f57d720ec5cadb298c980ef0228134aae915359602729897c'
  '53b8ea761593b2fc01ae23e0ba339ce8f375a4ccada613369929e2ab37ce886e'
  'SKIP'
)

# eof
