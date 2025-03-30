# Maintainer: Martins Mozeiko <martins.mozeiko@gmail.com>

pkgname=far2l-git
pkgver=r5664.9778d37a
pkgrel=1
pkgdesc='Linux port of FAR v2'
url='https://github.com/elfmz/far2l'
arch=('i686' 'x86_64')
license=('GPL2')
source=('git+https://github.com/elfmz/far2l')
sha256sums=('SKIP')
makedepends=('git' 'cmake')
depends=('libxml2' 'fmt' 'uchardet' 'wxwidgets-gtk3')
optdepends=(
  'libxi: TTY X11 backend'
  'openssl: FTPS support in NetRocks'
  'libssh: SFTP support in NetRocks'
  'smbclient: SMB support in NetRocks'
  'libnfs: NFS support in NetRocks'
  'neon: WebDAV support in NetRocks'
  'aws-sdk-cpp: AWS S3 support in NetRocks'
  'libarchive: more archive type support in multiarc'
)

pkgver() {
  cd "$srcdir"/far2l
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir"/far2l

  cmake . -DCMAKE_INSTALL_PREFIX="${pkgdir}"/usr -DCMAKE_XDGDATA_DIR="${pkgdir}"/usr/share -DCMAKE_BUILD_TYPE=Release -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -Wno-dev
  cmake --build . --target install
}
