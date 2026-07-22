# Maintainer: knightinfected <hmzmahmood5@gmail.com>
pkgname=pipewire-controller
pkgver=0.1.1
pkgrel=1
pkgdesc="GTK4/libadwaita control center for PipeWire — filter chains, HRIR virtual surround, drop-in config management"
arch=('any')
url="https://github.com/knightinfected/PipeWireController"
license=('GPL-3.0-or-later')
depends=('pipewire' 'wireplumber' 'pipewire-pulse' 'gtk4' 'libadwaita'
         'python' 'python-gobject' 'python-numpy' 'python-soundfile')
optdepends=('noise-suppression-for-voice: RNNoise noise-cancelling mic template'
            'lsp-plugins-ladspa: extra LADSPA plugins for imported chains')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b187807fb5f9591f65af3a24493a4628288fa4e70987977cda0b4a5bd203b4b5')

package() {
  cd "PipeWireController-$pkgver"

  install -d "$pkgdir/usr/share/$pkgname"
  cp -r pwctl "$pkgdir/usr/share/$pkgname/"
  install -Dm755 pipewire-controller "$pkgdir/usr/share/$pkgname/pipewire-controller"

  install -d "$pkgdir/usr/bin"
  ln -s "/usr/share/$pkgname/pipewire-controller" "$pkgdir/usr/bin/pipewire-controller"

  install -Dm644 pipewire-controller.desktop \
    "$pkgdir/usr/share/applications/pipewire-controller.desktop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
