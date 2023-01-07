# Maintainer: Méril Pilon <meril at mailfence dot com>
# Maintainer of emacs-git: Pedro A. López-Valencia <https://aur.archlinux.org/users/vorbote>
# Maintainer of emacs-pgtk-native-comp: Andrew Whatson <https://aur.archlinux.org/account/flatwhatson>

pkgname=emacs-gcc-wayland-devel-bin
pkgver=28.2.50.152031
pkgrel=1
pkgdesc="GNU Emacs. Development native-comp branch and pgtk branch combined, served as a binary."
arch=('x86_64')
url="https://github.com/mpsq/emacs-gcc-wayland-devel-builder"
license=('GPL3')
depends=('alsa-lib' 'cairo' 'gnutls' 'gtk3' 'libxml2' 'libxi' 'libsm' 'xcb-util' 'libxcb' 'libjpeg-turbo' 'libpng' 'giflib' 'libwebp' 'libtiff' 'libxpm' 'jansson' 'harfbuzz' 'gpm' 'libgccjit' 'webkit2gtk')
provides=('emacs')
replaces=('emacs')

source=("$pkgname-$pkgver.tar.gz::https://github.com/mpsq/emacs-gcc-wayland-devel-builder/releases/download/$pkgver/$pkgver.tar.gz")
sha512sums=("ef23b6714f42f43bb7f0f92e36f848ba22a92652ce3b24785d9644b75290f2cee12b742c5df6b0db89ea25ad0e471f959488465d21e906eda05b81db62c3ee4f")

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
