# Maintainer: igo95862 at yandex dot ru
pkgname=bubblejail
pkgver=0.10.2
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
  'python-cattrs'
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
sha512sums=('52bdbdcda4cefd170f1e1e3f822292ae6866986317f2064402137066cd279a27108a734a9a58f5642564c2e758c805a836020e2621845c31dd3a350c7cc6f084'
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
