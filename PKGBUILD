# Maintainer: Luis Bocanegra <luisbocanegra17b at gmail dot com>
_gitname=kurve
pkgname=plasma6-applets-kurve-git
pkgver=1.1.0.r9.g6b832f2
pkgrel=1
pkgdesc="Audio visualizer widget powered by CAVA for the KDE Plasma Desktop"
arch=('any')
url="https://github.com/luisbocanegra/$_gitname"
license=('GPL3')
depends=('libplasma' 'cava' 'python' 'python-websockets' 'qt6-websockets')
makedepends=('gcc' 'extra-cmake-modules' 'git')
source=("$_gitname"::"git+${url}")
sha256sums=('SKIP')
provides=('plasma6-applets-plasma-audio-visualizer' 'plasma6-applets-kurve')
conflicts=('plasma6-applets-plasma-audio-visualizer' 'plasma6-applets-kurve')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
  cd "${srcdir}/${_gitname}"
  python ./kpac i18n --no-merge
  cmake -B build -S . -DINSTALL_PLASMOID=ON -DBUILD_PLUGIN=ON
  cmake --build build
}

package() {
  cd "${srcdir}/${_gitname}"
  DESTDIR="$pkgdir" cmake --install build
  chmod 755 "$pkgdir/usr/share/plasma/plasmoids/luisbocanegra.audio.visualizer/contents/ui/tools/commandMonitor"
}
