# Maintainer:	       EndlessEden <endlesseden@users.noreply.github.com>
# Previous Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: 	       Spencer Muise <smuise@spencermuise.ca>

pkgname=plex-mpv-shim
pkgver=1.11.1
pkgrel=1
pkgdesc='Cast media from Plex Mobile and Web apps to MPV'
arch=('any')
url='https://github.com/endlesseden/plex-mpv-shim' # NOTE: Switched to my public repo, until upstream tags 1.11.1.
license=('MIT')
depends=('python-certifi' 'python-mpv' 'python-mpv-jsonipc' 'python-requests')
optdepends=('mpv-shim-default-shaders: for the default shader pack'
            'python-pystray: for system tray support'
            'tk: for GUI support')
makedepends=('python-setuptools')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('a4c52e516cb138684927f9f7f270e1e9d9dd77728394800d52569f7c70b782302bb2f68f7ab16ead19322eae4bff8eca5b7f4e2c155db86c6593303a375e5d07')

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
