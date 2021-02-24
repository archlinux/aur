# Maintainer: Michał Przybyś <michal@przybys.eu>
pkgname=kickoff-legacy-git
pkgver=r4.6bd1d39
pkgrel=1
pkgdesc='Kickoff launcher before the redesign in 5.21'
arch=(x86_64)
url='https://store.kde.org/p/1468103/'
license=(GPL2)
depends=(qt5-base
        qt5-declarative
        plasma-framework)
makedepends=(git
            extra-cmake-modules)
source=('git+https://invent.kde.org/mikeljohnson/kickoff-legacy.git')
sha256sums=(SKIP)

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr -B build ${pkgname%-git}
  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
