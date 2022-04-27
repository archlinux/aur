# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>

pkgname=smile-emoji-picker
_pkgname=smile
pkgver=1.5.4
pkgrel=1
pkgdesc="An emoji picker with custom tags support"
arch=('any')
url="https://github.com/mijorus/smile"
license=('GPL3')
depends=('libwnck3' 'python-manimpango')
makedepends=('meson')
checkdepends=('appstream-glib' 'desktop-file-utils')
optdepends=('noto-fonts-emoji')
source=($url/archive/$pkgver.tar.gz)
b2sums=('8df48b9de96ad7a1eddf847da641873799a787cc04835d037597e8c5fc2348a2e6a0beb849023456fd524c4ec6feb7b09506ebeb6565392fd3cb3dedec08254e')

# Special thanks to Mark Wagie https://github.com/yochananmarqos/pkgbuilds/blob/master/smile/PKGBUILD
prepare() {
  cd "$_pkgname-$pkgver"
  sed -i 's/MESON_INSTALL_PREFIX/MESON_INSTALL_DESTDIR_PREFIX/g' \
    build-aux/meson/emoji_list/generate_emoji_dict.py

  sed -i 's/MESON_INSTALL_PREFIX/MESON_INSTALL_DESTDIR_PREFIX/g' \
    build-aux/meson/postinstall.py
}

build() {
  arch-meson "$_pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
