# Maintainer: igo95862 at yandex dot ru
pkgname=bubblejail
pkgver=0.9.5
pkgrel=1
pkgdesc="Bubblewrap based sandboxing utility"
arch=('x86_64')
url="https://github.com/igo95862/bubblejail"
license=('GPL-3.0-or-later')
depends=(
  'python'
  'python-pyxdg'
  'bubblewrap'
  'python-tomli-w'
  'xdg-dbus-proxy'
  'hicolor-icon-theme'
  'python-pyqt6'
  'desktop-file-utils'
  'libnotify'
)
optdepends=(
  'bash-completion: completions for bash shell'
  'fish: completions for fish shell'
  'slirp4netns: Namespaced networking stack'
)
makedepends=(
  'meson'
  'python-jinja'
  'scdoc'
  # For python-lxns
  'gcc'
  'linux-headers'
)
source=(
  "$url/releases/download/$pkgver/bubblejail-$pkgver.tar.xz"
  "$url/releases/download/$pkgver/bubblejail-$pkgver.tar.xz.sig"
)
# To get the valid GPG key
# gpg --keyserver https://keys.mailvelope.com/ --search-keys 5A3D06576A6A67443DFBE856F1A55E62951B2143
# Alternative if the above keyserver does not work
# curl -s 'https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x5a3d06576a6a67443dfbe856f1a55e62951b2143' | gpg --import
validpgpkeys=('5A3D06576A6A67443DFBE856F1A55E62951B2143')
sha512sums=('fdf47e32cf9c7994db12731603176f4c4635a30fab7d4abf7167f0e3b06a156d075a979e4a13559e4aeba67bf37712449a5f1fdc5a40a340a9a2c66617ed0a5d'
            'SKIP')

build () {
  arch-meson "${srcdir}/${pkgname}-${pkgver}" build \
    -Duse-vendored-python-lxns=enabled \
    --wipe
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
