# Maintainer: Mike Cuche <cuche AT mailbox.org>

pkgname=dosbox-x
pkgver=0.83.22
pkgrel=2
pkgdesc="x86 emulator with builtin DOS, with patches with more features"
arch=(i686 x86_64 aarch64)
url="http://dosbox-x.com"
license=(GPL)
depends=(fluidsynth libxkbfile libpng libxrandr mesa ffmpeg4.4 physfs libslirp libpcap)
makedepends=(glu libpcap libslirp)
optdepends=('openglide-git: Third-party 3dfx Glide API support')
conflicts=(dosbox-x-git)
source=(https://github.com/joncampbell123/dosbox-x/archive/dosbox-x-v${pkgver}.tar.gz)

sha256sums=('75c5c1eb3b78701a80ad816f414640894cb0b5998a1a4d7f2af064b47a57b8c9')

build() {
  cd $srcdir/dosbox-x-dosbox-x-v${pkgver}
  sed -i -e 's/-j3/-j$(nproc)/g' build
 PKG_CONFIG_PATH="/usr/lib/ffmpeg4.4/pkgconfig" ./build
}

package() {
  cd $srcdir/dosbox-x-dosbox-x-v${pkgver}
  make DESTDIR="${pkgdir}" install
}
