# Maintainer: knightinfected <hmzmahmood5@gmail.com>
pkgname=pipewire-controller
pkgver=0.3.6
pkgrel=1
pkgdesc="GTK4/libadwaita control center for PipeWire — live level meters, parametric equalizer, microphone cleanup, patchbay, monitoring, virtual devices, effect inserts, filter chains, HRIR virtual surround, drop-in config management"
arch=('any')
url="https://github.com/knightinfected/PipeWireController"
license=('GPL-3.0-or-later')
depends=('pipewire' 'wireplumber' 'pipewire-pulse' 'gtk4' 'libadwaita'
         'python' 'python-gobject' 'python-numpy' 'python-soundfile')
optdepends=('noise-suppression-for-voice: RNNoise noise-cancelling mic template'
            'lsp-plugins-ladspa: extra LADSPA plugins for chains and effect racks'
            'lsp-plugins-lv2: extra LV2 plugins for effect racks'
            'carla: bridge VST3/CLAP plugins into the graph via the patchbay')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1ad233dacf69f8ad0d9bc46e3636776de3ed4844de94c11c4f632587e1e8a06e')

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
