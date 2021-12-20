# Maintainer: Danilo Bargen <aur at dbrgn dot ch>
pkgname=muslcc-arm-linux-musleabi-cross-bin
name=${pkgname/-bin/}
name=${name/muslcc-/}
pkgver=11.2.1
pkgrel=1
pkgdesc="Static musl-based cross-compilation toolchain provided by musl.cc"
arch=('x86_64' 'i686')
url="https://musl.cc/"
license=('MIT')
depends=()
makedepends=()
options=('!strip')
source=(
  "https://more.musl.cc/$pkgver/$CARCH-linux-musl/arm-linux-musleabi-cross.tgz"
  "hooks.install"
)
install=hooks.install
sha512sums=(
  'f37de55027a8ab037b2fab1e890719021cc9e53d6ee0627257b2b92e5eeb30847826bd132415898df70735295c80c6bb0a1bb27676bb9029ad255c5fe2753f0f'
  'b16a6b5f20dde4121df456220c99304e4b6c25c5004b4ab5b923f94c603fe042076d2fb81d545926d940d19e02ccc3f097c0c1878abf6aa42dfdccbabd0e6f64'
)

package() {
  # Copy toolchain to /opt/muslcc/
  mkdir -p "$pkgdir/opt/muslcc/"
  cp -R "$srcdir/$name/" "$pkgdir/opt/muslcc/"

  # Add to PATH
  mkdir -p "$pkgdir/etc/profile.d/"
  echo -e "#!/bin/sh\nexport PATH=\$PATH:\"/opt/muslcc/$name/bin/\"" > "$pkgdir/etc/profile.d/$name.sh"
  chmod 0644 "$pkgdir/etc/profile.d/$name.sh"
}

# vim:set ts=2 sw=2 et:
