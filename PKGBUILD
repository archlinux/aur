# Maintainer: Martins Mozeiko <martins.mozeiko@gmail.com>

pkgname=far2l-git
pkgver=r7530.bcfe026fe
pkgrel=1
pkgdesc='Linux port of FAR v2'
url='https://github.com/elfmz/far2l'
arch=('i686' 'x86_64' 'aarch64')
license=('GPL2')
source=('git+https://github.com/elfmz/far2l')
sha256sums=('SKIP')
conflicts=('far2l' 'far2l-ttyx' 'far2l-gui')
provides=('far2l' 'far2l-ttyx' 'far2l-gui')
options=('!lto')
makedepends=('git' 'cmake')
depends=('libxml2' 'uchardet' 'wxwidgets-gtk3')
optdepends=(
  'libxi: TTY X11 backend'
  'openssl: FTPS support in NetRocks'
  'libssh: SFTP support in NetRocks'
  'smbclient: SMB support in NetRocks'
  'libnfs: NFS support in NetRocks'
  'neon: WebDAV support in NetRocks'
  'aws-sdk-cpp: AWS S3 support in NetRocks'
  'libarchive: more archive type support in multiarc'
  'ffmpeg: ImageViewer plugin'
  'imagemagick: ImageViewer plugin'
)

pkgver() {
  cd "$srcdir"/far2l
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -S "$srcdir"/far2l -B "$srcdir"/far2l/build -DCMAKE_INSTALL_PREFIX="${pkgdir}"/usr -DCMAKE_BUILD_TYPE=Release -Wno-dev
}

package() {
  cmake --build "$srcdir"/far2l/build --target install
}
