# Maintainer: AtticFinder65536 <atticventilation-aur at protonmail dot com>

pkgname=cyanrip-git
pkgver=0.9.0.r15.g36b248b
pkgrel=2
pkgdesc='Fully featured CD ripping program'
arch=('x86_64')
url='https://github.com/cyanreg/cyanrip'
license=('GPL3')
depends=('curl' 'ffmpeg' 'libcdio-paranoia' 'libmusicbrainz5')
makedepends=('git' 'meson' 'ninja')
source=('git+https://github.com/cyanreg/cyanrip.git')
b2sums=('SKIP')
provides=('cyanrip')
conflicts=('cyanrip')

pkgver()
{
  cd cyanrip
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build()
{
  # default in meson.build: debugoptimized
  meson setup --prefix=/usr --buildtype=plain cyanrip build
  meson compile -C build
}

package()
{
  meson install -C build --destdir "$pkgdir"
}
