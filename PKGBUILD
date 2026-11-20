# Maintainer: Yasir Hassan <abdulebaroo@gmail.com>
pkgname=hush-shell
pkgver=0.4.0
pkgrel=1
pkgdesc='Dynamic island shell for Hyprland, built on Quickshell: bar, launcher, notifications, control center and lock in one pill'
arch=(any)
url='https://github.com/sirrryasir/hush'
license=(MIT)
depends=(hyprland quickshell matugen awww pipewire python python-pillow lua imagemagick git
         inter-font ttf-material-symbols-variable)
optdepends=('cliphist: clipboard history'
            'wf-recorder: screen recording'
            'fprintd: fingerprint unlock')
conflicts=(hush hush-git)  # hush: unrelated AUR package that also ships /usr/bin/hush
install=hush-shell.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/sirrryasir/hush/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('786ad7f5d32c0c48c8d9a310870c548afcad7b7157332b8475005c1c341f46ff')

package() {
  cd "hush-$pkgver"
  install -d "$pkgdir/usr/share/hush"
  cp -a --no-preserve=ownership . "$pkgdir/usr/share/hush"
  rm -rf "$pkgdir/usr/share/hush"/{.git,.githooks,tests,assets/brand/src}
  install -d "$pkgdir/usr/bin"
  ln -s /usr/share/hush/bin/hush "$pkgdir/usr/bin/hush"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
