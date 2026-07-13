# Maintainer: lightjunction
pkgname=lab-safety-system-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Prebuilt laboratory safety management information system (zero-config setup)"
arch=('x86_64')
url="https://github.com/LIghtJUNction/lab-safety-system"
license=('AGPL-3.0-only')
depends=(
  'gcc-libs'
  'glibc'
  'ca-certificates'
  'postgresql'
  'curl'
  'openssl'
  'zlib'
  'brotli'
  'zstd'
)
optdepends=('nginx: optional reverse proxy')
provides=("lab-safety-system=$pkgver")
conflicts=('lab-safety-system')
backup=('etc/lab-safety-system/lab-safety-system.env')
source=(
  'lab-safety-system.service'
  'lab-safety-system.env'
  'lab-safety-system.tmpfiles'
  'lab-safety-system.sysusers'
  'lab-safety-system-setup'
)
source_x86_64=(
  "https://github.com/LIghtJUNction/lab-safety-system/releases/download/v${pkgver}/lab-safety-system-${pkgver}-${CARCH}.tar.zst"
)
sha256sums=(
  'af49555edd75008438951219a13cbb4dcd7bd84768a0890e349af37cd8ab8205'
  '189b84283c9b2e4a05da3048d16ad8ab2407122842a35c89dbb4d59aae016bb2'
  '3d5b368aa9a7006b72d3ab05309d8b6cf0c9cc70e166307873b125e8f3f50f20'
  'bc777a2cc2d67565bbcdb1f0241f570052d50372a5b979b4f7fb298aead1b140'
  '304768226126ec5d377514979e00efe4c73158d343bf516251afc6ee8601fe8b'
)
sha256sums_x86_64=(
  '03d29645cc694504f0cefc416d61c25e4a4ecccf91e6c3fca7923ccd10be582f'
)

package() {
  local release_dir="$srcdir/lab-safety-system-${pkgver}-${CARCH}"

  install -Dm755 "$release_dir/lab-safety-system" \
    "$pkgdir/usr/bin/lab-safety-system"
  install -dm755 "$pkgdir/usr/share/lab-safety-system/public"
  cp -a "$release_dir/public/." "$pkgdir/usr/share/lab-safety-system/public/"

  install -Dm644 "$srcdir/lab-safety-system.service" \
    "$pkgdir/usr/lib/systemd/system/lab-safety-system.service"
  install -Dm644 "$srcdir/lab-safety-system.env" \
    "$pkgdir/etc/lab-safety-system/lab-safety-system.env"
  install -Dm644 "$srcdir/lab-safety-system.tmpfiles" \
    "$pkgdir/usr/lib/tmpfiles.d/lab-safety-system.conf"
  install -Dm644 "$srcdir/lab-safety-system.sysusers" \
    "$pkgdir/usr/lib/sysusers.d/lab-safety-system.conf"
  install -Dm755 "$srcdir/lab-safety-system-setup" \
    "$pkgdir/usr/bin/lab-safety-system-setup"
  install -Dm644 "$release_dir/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
