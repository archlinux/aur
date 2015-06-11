# Maintainer : jyantis <yantis@yantis.net>
# Contributor: Zom <zom[at]eevul[dot]org>
# Contributor: (archdria) Adria Arrufat <swiftscythe (at) gmail.com>

pkgname=kdemultimedia-kmix-git
pkgver=4.6RC1.r1978.f911772
pkgrel=2
pkgdesc="KDE volume control program. KMix. KDE's full featured mini mixer"
arch=('i686' 'x86_64')
url="http://www.kde.org/applications/multimedia/kmix/"
license=('GPL' 'FDL')
depends=('kdebase-runtime')
makedepends=('cmake' 'automoc4' 'git' 'docbook-xsl')
provides=("kdemultimedia-kmix")
conflicts=("kdemultimedia-kmix")
source=("kmix::git://anongit.kde.org/kmix")
md5sums=('SKIP')
install=kmix.install
epoch=1

pkgver() {
  cd kmix
  _version=$(grep -F "#define APP_VERSION" core/version.h | awk -F\" '{print $2}')
  printf "%s." "$_version"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd kmix
  cmake . -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd kmix
  make DESTDIR=${pkgdir} install
}
