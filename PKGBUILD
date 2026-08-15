# Maintainer: Snis <aur@snis.org>

pkgbase=flamenco-bin
pkgname=('flamenco-manager-bin' 'flamenco-worker-bin')
pkgver=3.9.3
pkgrel=1
pkgdesc='Render farm management software for animation and visual effects'
arch=('x86_64')
url='https://flamenco.blender.org/'
license=('GPL-3.0-or-later')
source=(
  "https://flamenco.blender.org/downloads/flamenco-${pkgver}-linux-amd64.tar.gz"
  'flamenco-manager@.service'
  'flamenco-worker@.service'
  'README.Arch'
  'flamenco-manager-bin.install'
  'flamenco-worker-bin.install'
)
sha256sums=(
  'c3cf18daac34cbfc34e87c8aee883da351c0d31fedd498f445b815698cf504f2'
  '951831a548eb67e181c6e3fa4e00863793815f56abb1c565ce5e3b929b26140f'
  '88d58aa2b60e78da7a0a6031dd57b566a69bcd8c14d42a898ad73a5031e2ff8a'
  'd369edabb4d1c38eb0410df0e02ef8e9b79f2524b4e41e23591494cf15404d64'
  '6b1e22b3f3227dad86b56d779a7a7a3d02b566a301619891b999709d9b832d5e'
  '010a7595cdefde65d3da0d6df8f25633f31e2c73342bcd22146f24d17ee035c4'
)

package_flamenco-manager-bin() {
  pkgdesc='Manager for the Flamenco render farm system'
  provides=("flamenco-manager=$pkgver")
  conflicts=('flamenco-manager')
  install='flamenco-manager-bin.install'

  install -Dm755 "$srcdir/flamenco-${pkgver}-linux-amd64/flamenco-manager" \
    "$pkgdir/usr/bin/flamenco-manager"
  install -Dm644 "$srcdir/flamenco-manager@.service" \
    "$pkgdir/usr/lib/systemd/system/flamenco-manager@.service"
  install -Dm644 "$srcdir/README.Arch" \
    "$pkgdir/usr/share/doc/$pkgname/README.Arch"
  install -Dm644 "$srcdir/flamenco-${pkgver}-linux-amd64/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_flamenco-worker-bin() {
  pkgdesc='Worker for the Flamenco render farm system'
  depends=('ffmpeg')
  optdepends=('blender: render Blender jobs')
  provides=("flamenco-worker=$pkgver")
  conflicts=('flamenco-worker')
  install='flamenco-worker-bin.install'

  install -Dm755 "$srcdir/flamenco-${pkgver}-linux-amd64/flamenco-worker" \
    "$pkgdir/usr/bin/flamenco-worker"
  install -Dm644 "$srcdir/flamenco-worker@.service" \
    "$pkgdir/usr/lib/systemd/system/flamenco-worker@.service"
  install -Dm644 "$srcdir/README.Arch" \
    "$pkgdir/usr/share/doc/$pkgname/README.Arch"
  install -Dm644 "$srcdir/flamenco-${pkgver}-linux-amd64/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
