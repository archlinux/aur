# Maintainer: Méril Pilon <meril at mailfence dot com>
# Maintainer of emacs-git: Pedro A. López-Valencia <https://aur.archlinux.org/users/vorbote>
# Maintainer of emacs-pgtk-native-comp: Andrew Whatson <https://aur.archlinux.org/account/flatwhatson>

pkgname=emacs-gcc-wayland-devel-bin
pkgver=28.2.50.152031
pkgrel=2
pkgdesc="GNU Emacs. Development native-comp branch and pgtk branch combined, served as a binary."
arch=('x86_64')
url="https://github.com/mpsq/emacs-gcc-wayland-devel-builder"
license=('GPL3')
depends=('alsa-lib' 'cairo' 'gnutls' 'gtk3' 'libxml2' 'libxi' 'libsm' 'xcb-util' 'libxcb' 'libjpeg-turbo' 'libpng' 'giflib' 'libwebp' 'libtiff' 'libxpm' 'jansson' 'harfbuzz' 'gpm' 'libgccjit' 'webkit2gtk')
provides=('emacs')
replaces=('emacs')

source=("$pkgname-$pkgver.tar.gz::https://github.com/mpsq/emacs-gcc-wayland-devel-builder/releases/download/$pkgver-$pkgrel/$pkgver.tar.gz")
sha512sums=("8eb65362b8a33c22e82011bcfc8eccec30d532d176d3e94ade7bed8d9a4b66fb53c09f7b8ba9047810428c18694567992f2627021985c5b8cfedc67002062600")

package() {
  cp -r usr/ $pkgdir/
  cp -r var/ $pkgdir/

  # fix user/root permissions on usr/share files
  find "$pkgdir"/usr/share/emacs/ | xargs chown root:root

  # fix permssions on /var/games
  chmod 775 -R "$pkgdir"/var/games
  chmod 775 -R "$pkgdir"/var/games/emacs
  chown -R root:games "$pkgdir"/var/games
}
