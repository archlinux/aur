# Maintainer: Danilo Bargen <aur at dbrgn dot ch>
pkgname=muslcc-arm-linux-musleabihf-cross-bin
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
  "https://more.musl.cc/$pkgver/$CARCH-linux-musl/arm-linux-musleabihf-cross.tgz"
  "hooks.install"
)
install=hooks.install
sha512sums=(
  '44df5fdc148c99dbdecd668b0a8a5fb02d5d81fce78fd5930c4b82aee0d237681f05a213e1d19f27f1e97942dd00952d69c28549cfeb4feeaabb820a836f194d'
  'aebc4496c98f91cf9b25a19a788e8baca8b9bc9d14fdf6000b1a819843a05f10f23046eef9fe0b3b9c75fe46a051ab80d0064adb6c32693af1390f11a5ef0be0'
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
