# Maintainer: Jonatan R. Fischer <jonafischer at gmail dot com>
pkgname=mcumgrctl-bin
pkgver=0.20.0
pkgrel=2
pkgdesc="Rust CLI for Zephyr MCUmgr (prebuilt binary)"
arch=('x86_64')
url="https://github.com/Finomnis/mcumgr-toolkit"
license=('MIT' 'Apache-2.0')
options=('!debug')  # avoids an empty -debug package: the binary is prebuilt and stripped
depends=()          # statically linked (musl), needs nothing
provides=('mcumgrctl')
conflicts=('mcumgrctl')

# NOTE: the upstream tag is "0.20.0" (no "v" prefix); the asset is named "mcumgrctl-linux"
source=(
  "mcumgrctl::https://github.com/Finomnis/mcumgr-toolkit/releases/download/${pkgver}/mcumgrctl-linux"
  "LICENSE-APACHE::https://raw.githubusercontent.com/Finomnis/mcumgr-toolkit/${pkgver}/LICENSE-APACHE"
  "LICENSE-MIT::https://raw.githubusercontent.com/Finomnis/mcumgr-toolkit/${pkgver}/LICENSE-MIT"
)

sha256sums=(
  '1df820bb2ffaa6f12a21152e8a3c949dc2a989e01608dda6bb90308e32bdcf3c'
  'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4'
  'd4e182b6d0e8776794e0b59f70abb99aece14e745952711edbcdbdac9efcc931'
)

check() {
  chmod +x "$srcdir/mcumgrctl"  # the download arrives without the executable bit
  "$srcdir/mcumgrctl" --version
}

package() {
  install -Dm755 "$srcdir/mcumgrctl" \
    "$pkgdir/usr/bin/mcumgrctl"
  install -Dm644 "$srcdir/LICENSE-APACHE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
  install -Dm644 "$srcdir/LICENSE-MIT" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
