# Maintainer: Martin

_module=studio
pkgname=kde2-kde${_module}-git
pkgver=2.0.0.r8.0fcdbd7
pkgrel=1
pkgdesc="Fully-fledged IDE for KDE 2"
arch=(i686 x86_64)
url="https://github.com/sandsmark/kde${_module}"
license=("GPL2")
groups=(kde2)
depends=(kde2-kdelibs qt2-git hicolor-icon-theme)
makedepends=(cmake git)
provides=(kde2-kde${_module})
conflicts=(kde2-kde${_module})
options+=(libtool)

# Mirror
source=("git+https://invent.kde.org/sandsmark/kde2-kde${_module}.git")

md5sums=('SKIP')

pkgver() {
  cd kde2-kde${_module}
  printf "2.0.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  if [[ -d build ]]; then
    rm -rf build && mkdir build
  else
    mkdir build
  fi
}

build() {
  cd build
  cmake "$srcdir"/kde2-kde${_module} -DCMAKE_INSTALL_PREFIX=/usr -DKDEDIR=/usr/ -DCMAKE_BUILD_TYPE=Debug
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
  cd "$srcdir"/kde2-kde${_module}
}
