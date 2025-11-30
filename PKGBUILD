pkgname=spruce-shonubot-git
pkgver=0.0.0.r3f5b93b
pkgrel=1
pkgdesc="Spruce (shonubot) - lightweight cache cleaner / system maintenance tool (git)"
arch=('x86_64' 'aarch64')
url="https://github.com/shonubot/Spruce"
license=('GPL3')
depends=('python' 'python-gobject' 'gtk4' 'libadwaita' 'flatpak')
makedepends=('meson' 'ninja' 'pkgconf' 'python-setuptools' 'python-pip' 'git')
provides=('spruce-shonubot')
conflicts=('spruce')
source=("git+https://github.com/shonubot/Spruce.git")
sha256sums=('SKIP')
_gitdir="Spruce"

pkgver() {
  cd "${srcdir}/${_gitdir}"
  printf "0.0.0.r%s" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_gitdir}"
  meson setup build --prefix=/usr --localstatedir=/var --buildtype=release
  ninja -C build
}

package() {
  cd "${srcdir}/${_gitdir}"
  DESTDIR="${pkgdir}" ninja -C build install
}
