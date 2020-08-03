# Maintainer: Spencer Muise <smuise@spencermuise.ca>

pkgname=plex-mpv-shim
pkgver=1.9.0
pkgrel=2
pkgdesc="Cast media from Plex Mobile and Web apps to MPV"
arch=('any')
url='https://github.com/iwalton3/plex-mpv-shim'
license=('MIT')
depends=(
  'python'
  'mpv'
  'python-mpv'
  'python-requests'
  'python-mpv-jsonipc'
)
optdepends=(
  'python-pystray: system tray support'
  'tk: gui support'
  'mpv-shim-default-shaders: default shader pack'
)
makedepends=(
  'python-setuptools'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/iwalton3/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('d3ab4923bb2f4c5e57f68ea3ca80d0c3')

build() {
    cd $pkgname-$pkgver
    python setup.py build
}

package() {
    cd $pkgname-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    cd "${pkgdir}"
    ln -s "/usr/share/mpv-shim-default-shaders" "usr/lib/$(ls usr/lib/ | grep python)/site-packages/plex_mpv_shim/default_shader_pack"
}
