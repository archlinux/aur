# Maintainer: linkfrg
pkgname=ignis
pkgver=0.1
pkgrel=1
pkgdesc="Full-featured Python framework for building desktop shells using GTK4."
arch=('x86_64')
url="https://github.com/linkfrg/ignis"
license=('GPL-3.0-only')
makedepends=('gobject-introspection' 'meson')
depends=('python' 'glib2' 'glib2-devel' 'glibc' 'gtk4' 'gtk4-layer-shell' 'libpulse' 'python-cairo' 'python-gobject')
optdepends=('gst-plugin-pipewire: required for recorder service'
			'gst-plugins-good: required for recorder service'
			'gst-plugins-ugly: required for recorder service'			
			'python-requests: required for mpris service'
            'networkmanager: required for network service')
            
conflicts=('ignis-git')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v${pkgver}/ignis-v${pkgver}.tar.gz")
sha256sums=('555aee575c36f2473bace871ea4f575bca9faae14142222fafd471ffeff5f51c')

build() {
  cd $srcdir/$pkgname
  arch-meson build --libdir "lib/$pkgname"
  meson compile -C build
}

package() {
  cd $srcdir/$pkgname
  meson install -C build --destdir "$pkgdir"
}
