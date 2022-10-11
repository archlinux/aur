# Maintainer: Méril Pilon <meril at mailfence dot com>
# Maintainer of emacs-git: Pedro A. López-Valencia <https://aur.archlinux.org/users/vorbote>
# Maintainer of emacs-pgtk-native-comp: Andrew Whatson <https://aur.archlinux.org/account/flatwhatson>

pkgname=emacs-gcc-wayland-devel-bin
pkgver=28.1.50.151702
pkgrel=1
pkgdesc="GNU Emacs. Development native-comp branch and pgtk branch combined, served as a binary."
arch=('x86_64')
url="https://github.com/mpsq/emacs-gcc-wayland-devel-builder"
license=('GPL3')
depends=('alsa-lib' 'cairo' 'gnutls' 'gtk3' 'libxml2' 'libxi' 'libsm' 'xcb-util' 'libxcb' 'libjpeg-turbo' 'libpng' 'giflib' 'libwebp' 'libtiff' 'libxpm' 'jansson' 'harfbuzz' 'gpm' 'libgccjit' 'webkit2gtk')
provides=('emacs')
replaces=('emacs')

source=("$pkgname-$pkgver.tar.gz::https://github.com/mpsq/emacs-gcc-wayland-devel-builder/releases/download/$pkgver/$pkgver.tar.gz")
sha512sums=("16090b6e8bb52d6146ab382f90ae6abae867f685587a8a0fded36a8f1b30f2859c073232270fdd3e251cd8df7e5e9cb67dd7a2ca73cb8cca354a777ba28d301a")

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
