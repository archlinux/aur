# Maintainer: Ronny <ronny-aur[at]adke*org>
pkgname=boblight-v4l
_svnrev=479
pkgver=r395
pkgrel=1
pkgdesc="Collection of tools for driving lights connected to an external controller, compatible to new version of ffmpeg"
url="https://github.com/Nidhoggrr/boblight"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('libusbx' 'libxext' 'libxrender' 'mesa' 'portaudio' 'ffmpeg')
provides=('boblight')
conflicts=('boblight')
makedepends=('glu' 'svn')
#source=("svn+https://boblight.googlecode.com/svn/trunk#revision=$_svnrev"
source=("svn+https://github.com/Nidhoggrr/boblight.git/trunk"
        "boblight.service")
md5sums=('SKIP'
         '465a99144ad2e86a20d3433b426320b2')

pkgver() {
  cd "$srcdir/trunk"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "$srcdir/trunk"

  ./configure --prefix=/usr \
              --disable-static \
		--with-ffmpeg
  make
}

package() {
  cd "$srcdir/trunk"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "$srcdir/boblight.service" "$pkgdir/usr/lib/systemd/system/boblight.service"
}
