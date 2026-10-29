# Maintainer: DawnMagnet <DawnMagnet@users.noreply.github.com>
pkgname=mfile-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='Fast, static file(1) replacement with an embedded content-type model'
arch=('x86_64' 'aarch64')
url='https://github.com/DawnMagnet/mfile'
license=('Apache-2.0')
# Static cgo-free Go binary (CGO_ENABLED=0, stripped). No runtime libraries.
depends=()
options=('!strip' '!debug')
# Renamed local filenames include pkgver so makepkg does not reuse an older
# download that shared the upstream asset name. The URL keeps ${pkgver}, so a
# version bump does not rewrite these lines. sha256sums_* come from the
# release SHA256SUMS file (asset names mfile_${pkgver}_linux_amd64.tar.gz and
# mfile_${pkgver}_linux_arm64.tar.gz). scripts/update_package.py refreshes both
# per-arch source arrays and both sha256sums_* arrays from that file.
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/DawnMagnet/mfile/releases/download/v${pkgver}/mfile_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/DawnMagnet/mfile/releases/download/v${pkgver}/mfile_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('0022781691d94c0ceb1ea09df92ca5bce45c5404c2d487e3710276f0ece3d65e')
sha256sums_aarch64=('280bcb4d3d8f7fcdef2c4e97535ef7ebfe970095d5243f922e0758b13868988b')

package() {
  # The release tarball is flat: mfile, LICENSE, NOTICE, README.md.
  install -Dm755 "$srcdir/mfile" "$pkgdir/usr/bin/mfile"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/NOTICE" "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}
