pkgname=pipewire-git
pkgver=0.1.9.25.g07f12c97
pkgrel=1
pkgdesc="Multimedia processing graphs. (GIT version)"
arch=('x86_64')
url='https://pipewire.org'
license=('LGPL')
depends=('ffmpeg'
         'sbc'
         )
makedepends=('graphviz'
             'doxygen'
             'xmltoman'
             'git'
             'meson'
             )
conflicts=('pipewire')
provides=('pipewire')
source=('git+https://github.com/PipeWire/pipewire.git')
sha256sums=('SKIP')
backup=('etc/pipewire/pipewire.conf')

pkgver() {
  cd pipewire
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  cd pipewire

  ./autogen.sh \
    --prefix "/usr" \
    --sysconfdir "/etc"

}

build() {
  make -C pipewire
}

package() {
  make -C pipewire DESTDIR="${pkgdir}" install
}
