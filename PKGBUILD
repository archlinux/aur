# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=vorbis-tools-git
pkgver=r919.b61076d
pkgrel=1
pkgdesc="Command-line tools for creating and playing Ogg Vorbis files"
arch=('i686' 'x86_64')
url="http://www.vorbis.com/"
license=('GPL')
depends=('libvorbis' 'flac' 'speex' 'curl')
makedepends=('git')
provides=('vorbis-tools')
conflicts=('vorbis-tools')
source=("git+https://git.xiph.org/vorbis-tools.git"
        "vorbis-tools-CVE-2015-6749.patch::https://git.archlinux.org/svntogit/packages.git/plain/trunk/vorbis-tools-CVE-2015-6749.patch?h=packages/vorbis-tools"
        "vorbis-tools-cve9638-cve9639.patch::https://git.archlinux.org/svntogit/packages.git/plain/trunk/vorbis-tools-cve9638-cve9639.patch?h=packages/vorbis-tools")
sha256sums=('SKIP'
            '52f1d083c16b9caa2bc7bd5315210bac810dd6a0565e4c270650177a4c815fa7'
            '5a6d74de56e67613c4887e3fe9102aadfce4cd4a9a477fb2c1ed1a26f11fdff6')


prepare() {
  cd "vorbis-tools"

  patch -p1 -i "$srcdir/vorbis-tools-CVE-2015-6749.patch"
  patch -p1 -i "$srcdir/vorbis-tools-cve9638-cve9639.patch"
}

pkgver() {
  cd "vorbis-tools"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "vorbis-tools"

  ./autogen.sh
  ./configure --prefix="/usr"

  make
}

package() {
  cd "vorbis-tools"

  make DESTDIR="$pkgdir" install
}
