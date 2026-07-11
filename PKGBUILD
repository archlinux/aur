# Maintainer: Ahmet Arda Kavakcı <ahmetardakavakci at gmail dot com>
# Contributor: Marco Rodolfi <marco dot rodolfi at tuta dot io>
# Contributor: gaelic <gaelic at luchmhor dot net>
# Contributor: Peter Reschenhofer <peterreschenhofer at gmail dot com>

pkgname=gams
pkgver=54.2.0
pkgrel=1
pkgdesc='A high-level modeling system for mathematical optimization'
arch=('x86_64')
license=('custom')
url='https://gams.com/'
depends=('glibc' 'fuse2')
optdepends=('zlib: required by some solvers'
  'libxkbcommon: Wayland keyboard support for GAMS Studio')
options=('!strip')
# Official GAMS CDN, as linked from https://gams.com/download/
source=("$pkgname-$pkgver.exe::https://d37drm4t2jghv5.cloudfront.net/distributions/$pkgver/linux/linux_x64_64_sfx.exe"
  "gams-studio.desktop")
sha256sums=('0177621225c510a79ba5f4658d9320718d08286f2b75d4254eaa0f875e0a06a0'
            'e05cf76f5980b5a44c35dd812afafde262a53a00fc9fa89bcbca68e26a8edb16')

package() {
  install -d "$pkgdir/opt/gams" "$pkgdir/usr/bin"
  cp -a --no-preserve=ownership "gams${pkgver::4}_linux_x64_64_sfx/"* "$pkgdir/opt/gams/"
  install -Dvm644 gams-studio.desktop -t "$pkgdir/usr/share/applications/"
  ln -sv "/opt/gams/gams" "$pkgdir/usr/bin/gams"
  ln -sv "/opt/gams/studio/studio.AppImage" "$pkgdir/usr/bin/gams-studio"

  # license
  install -Dvm644 "gams${pkgver::4}_linux_x64_64_sfx/EULA.md" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
