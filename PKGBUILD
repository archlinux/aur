# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgbase='lua-gifine'
pkgname=('gifine')
pkgdesc='Quickly record and edit gifs and videos of your desktop'
pkgver=1
pkgrel=1
arch=('x86_64')
url="https://github.com/leafo/gifine"
license=('MIT')
depends=('ffmpeg' 'graphicsmagick' 'gifsicle' 'slop' 'lua51-lgi')
makedepends=('luarocks')
provides=('gifine')
source=("git+$url")
md5sums=('SKIP')

build() {
  mkdir -p 5.1
  # Build for 5.1
  (cd 5.1; luarocks build --pack-binary-rock --lua-version=5.1 --deps-mode=none ../"$pkgname"/"gifine-dev-$pkgver.rockspec")
}

package() {
  luarocks install --lua-version=5.1 --tree="$pkgdir/usr/" --deps-mode=none 5.1/*.rock
  # remove luarocks-created root manifest
  rm "$pkgdir/usr/lib/luarocks/rocks-5.1/manifest"
}

# vim:set ts=2 sw=2 et:
