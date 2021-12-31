# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Contributor: Joan Figueras <ffigue at gmail dot com>
# Contributor: Auteiy <dmitry@synh.me>

pkgname=kotatogram-desktop-bin
pkgdesc="Experimental Telegram Desktop fork with option to select custom fonts. - Static binaries"
pkgver=1.4.7
pkgrel=1
url="https://github.com/kotatogram/kotatogram-desktop"
arch=(x86_64)
license=('GPL3')
options=("!strip")

depends=(fuse)

optdepends=('xdg-desktop-portal: for native file dialogs, do not forget to install one of backends'
            'xdg-utils: for automatic opening of URLs, files and directories in proper applications')

conflicts=('kotatogram-desktop' 'kotatogram-desktop-dynamic-bin')
provides=('kotatogram-desktop')

source=($pkgname-$pkgver::$url/releases/download/k$pkgver/$pkgver-linux.tar.xz
        https://raw.githubusercontent.com/kotatogram/kotatogram-desktop/k$pkgver/lib/xdg/kotatogramdesktop.desktop
        icon16-$pkgver.png::$url/raw/k$pkgver/Telegram/Resources/art/icon16.png
        icon32-$pkgver.png::$url/raw/k$pkgver/Telegram/Resources/art/icon32.png
        icon48-$pkgver.png::$url/raw/k$pkgver/Telegram/Resources/art/icon48.png
        icon64-$pkgver.png::$url/raw/k$pkgver/Telegram/Resources/art/icon64.png
        icon128-$pkgver.png::$url/raw/k$pkgver/Telegram/Resources/art/icon128.png
        icon256-$pkgver.png::$url/raw/k$pkgver/Telegram/Resources/art/icon256.png
        icon512-$pkgver.png::$url/raw/k$pkgver/Telegram/Resources/art/icon512.png)

sha512sums=('29e48bf7c0e3b12dda43212e1f7edd1b5ee7fff2e1447098262aa5e324c327bb6de2d60199d223b93015416ed0d6d288d65e11fee6c923a335da0e08fbb76258'
            '5ac25c8b41792d170df5f124001dbe1ea4d26d0f16add6d2a5e6463167ae613a1316dc48d462bc1a7b319722df01d749f1375ef6112168960b62e343e8bef72b'
            '89bb399142ec968a1c9d96e7e3639036aa8d70968c89c6d2b77def5ea6cbb0d88de8b3c8bb10f457600cdd4c7926d7f8ff9907f511aaaac832b218c9353c4b50'
            'facff9860ebb15045e6c7fb6483317c2319bea8b256cbc0986a252863ccedd80e1cf1e4c81a259b303651b450371b1daaf9f61be26129296b71c58ed08644cf9'
            '655bce2e9e55933a733a681e117be0e541cf2f0bdb7b60d9baacaa634b0cf4ba0add53d174807a22449b9ffbbb2b050f24aadb1974d2e471f841d3c227c04c97'
            '1882b6b91c19cc2a5a1bf809f279f3a2c684054a53d26bf1035e61a170e2c6c522a932a32207b1aa7e06437c19403e239ae2b8f258d51996e7edd61f8b93364b'
            'a69ca8c96e9cc3cc1fa3106408bb873c5ac1d41ae40e34b5b1e19784442b590bc6a55567a586d4296f2b7387d6ff714f8b511c068b315b98f5666f9bf8b1217c'
            'b103f3a07c82e7d47602b031c190d902b60b49c0c0750d1e51255cc403286e04b037c66ff0804ce3eb5a7d94fdb2f8219947609f71cc716d44c41d40f4c35344'
            'baba4ba1cb6064fba20b7b85ae9074666e600e2fdbee3626db94a2218ab4e31980a503f09fb043ce17c9e17d57296b479202ae386cbcc5e44a2397aad015b857')

package() {
  # Creating needed directories
  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/share/pixmaps/"
  install -dm755 "$pkgdir/usr/share/applications/"
  install -dm755 "$pkgdir/etc/kotatogram-desktop"

  # Disable build in updater
  echo "/usr/bin/kotatogram-desktop" > "$pkgdir/etc/kotatogram-desktop/externalupdater"

  # Program
  install -Dm755 "$srcdir/Kotatogram/Kotatogram" "$pkgdir/usr/bin/kotatogram-desktop"

  # Desktop launcher
  install -Dm644 "$srcdir/icon256-$pkgver.png" "$pkgdir/usr/share/pixmaps/kotatogram.png"
  install -Dm644 "$srcdir/kotatogramdesktop.desktop" "$pkgdir/usr/share/applications/kotatogramdesktop.desktop"

  # Icons
  local icon_size icon_dir
  for icon_size in 16 32 48 64 128 256 512; do
    icon_dir="$pkgdir/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps"
    install -d "$icon_dir"
    install -m644 "$srcdir/icon${icon_size}-$pkgver.png" "$icon_dir/kotatogram.png"
  done
}
# vim:set ts=2 sw=2 et:
