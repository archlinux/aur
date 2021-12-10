# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Spencer Muise <smuise@spencermuise.ca>

pkgname=plex-mpv-shim
pkgver=1.10.3
pkgrel=2
pkgdesc='Cast media from Plex Mobile and Web apps to MPV'
arch=('any')
url=https://github.com/iwalton3/plex-mpv-shim
license=('MIT')
depends=('python-certifi' 'python-mpv' 'python-mpv-jsonipc' 'python-requests')
optdepends=('mpv-shim-default-shaders: for the default shader pack'
            'python-pystray: for system tray support'
            'tk: for GUI support')
makedepends=('python-setuptools')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('cd1ebe5086d3125efa7215e358bf0c616d125d50beec3d8909a434136f16f38f2942ae876c684b59ce308ce61e5cc24fe3cee980843388887cce6d34bdcd1e2e')

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE.md

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  ln -s /usr/share/mpv-shim-default-shaders \
    "$pkgdir"/"$site_packages"/plex_mpv_shim/default_shader_pack
}
