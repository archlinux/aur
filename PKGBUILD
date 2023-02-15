# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Spencer Muise <smuise@spencermuise.ca>

pkgname=plex-mpv-shim
pkgver=1.11.0
pkgrel=1
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
b2sums=('cb4d8d8e79d8190cb1e2ceb4466f7800c598dd9c53e9b16908b1ca0bedfbe318f90526cab487936a7200717a12f3dd7c3f4d9bd9f556332ad95986ba5103b63a')

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
