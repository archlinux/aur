pkgname=pipewire-git
pkgver=0.1.7.34.ge5e360d5
pkgrel=1
pkgdesc="Multimedia processing graphs. (GIT version)"
arch=('i686' 'x86_64')
url='https://pipewire.org'
license=('LGPL')
depends=('ffmpeg'
         'libsystemd'
         )
makedepends=('graphviz'
             'doxygen'
             'xmltoman'
             'git'
             'meson'
             'ffmpeg'
             )
optdepends=('ffmpeg: ffmpeg, alsa and jack support')
conflicts=('pipewire')
provides=('pipewire')
source=("git+https://github.com/PipeWire/pipewire.git")
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
  cd pipewire
  make
}

package() {
  make -C pipewire DESTDIR="${pkgdir}" install
}
