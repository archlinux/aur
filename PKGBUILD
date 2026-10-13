# Maintainer: Yasir Hassan <abdulebaroo@gmail.com>
pkgname=hush-git
pkgver=0.2.0.r4.g2eb4350
pkgrel=1
pkgdesc='Quiet Hyprland rice: Quickshell shell, matugen themes and wallpapers'
arch=(any)
url='https://github.com/sirrryasir/hush'
license=(MIT)
depends=(hyprland quickshell matugen awww hyprlock python python-pillow lua imagemagick git
         inter-font ttf-material-symbols-variable)
makedepends=(git)
optdepends=('sddm: Hush login screen'
            'cliphist: clipboard history'
            'wf-recorder: screen recording'
            'fprintd: fingerprint unlock')
conflicts=(hush)  # unrelated AUR package that also ships /usr/bin/hush
install=hush-git.install
source=('git+https://github.com/sirrryasir/hush.git')
sha256sums=('SKIP')

pkgver() {
  cd hush
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd hush
  install -d "$pkgdir/usr/share/hush"
  cp -a --no-preserve=ownership . "$pkgdir/usr/share/hush"
  rm -rf "$pkgdir/usr/share/hush"/{.git,.githooks,tests,assets/brand/src}
  install -d "$pkgdir/usr/bin"
  ln -s /usr/share/hush/bin/hush "$pkgdir/usr/bin/hush"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
