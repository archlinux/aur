# Maintainer: knightinfected <hmzmahmood5@gmail.com>
pkgname=pipewire-controller
pkgver=0.3.4
pkgrel=1
pkgdesc="GTK4/libadwaita control center for PipeWire — patchbay, monitoring, virtual devices, effect inserts, filter chains, HRIR virtual surround, drop-in config management"
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
sha256sums=('041b1e2158d1482d776a8a3fca1aba398955fdcd956c7de3b0a71645918a9078')

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
