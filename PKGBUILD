# Maintainer: Kristyan Carvalho <kristyancarvalho@hotmail.com>
pkgname=brmgen-gtk
pkgver=0.5.1
pkgrel=1
pkgdesc='GTK interface for brmgen - Generate editable brModelo models from YAML/JSON'
arch=('any')
url='https://github.com/kristyancarvalho/brmgen'
license=('MIT')
depends=('brmgen' 'python' 'python-gobject' 'libadwaita')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=(
  "brmgen-gtk-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/brmgen-gtk-${pkgver}.tar.gz"
  "LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE"
)
sha256sums=(
  '87af2d879ae007f30dc2d9c1d9dae771682484e72392caffbf5b6d2a3c89cacd'
  'fb6b85af7158d2f3b5784a3ee0113bbdc94371c681518acb7bb66cf806a1f472'
)

build() {
  cd "brmgen-gtk-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "brmgen-gtk-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 "$srcdir/LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/brmgen-gtk/LICENSE"

  # Install .desktop file
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/io.github.kristyancarvalho.brmgen.gtk.desktop" <<'EOF'
[Desktop Entry]
Name=BRMGen
GenericName=BRMGen GTK
Comment=Generate editable brModelo conceptual models from YAML/JSON
Exec=brmgen-gtk
Icon=io.github.kristyancarvalho.brmgen.gtk
Terminal=false
Type=Application
Categories=Development;Database;
Keywords=database;model;brmodelo;erd;
StartupNotify=true
EOF
}