# Maintainer: Martin

_module=kio-sftp-kde4
pkgname=kde2-${_module}-git
pkgver=2.2.2.r18.f2e832e
pkgrel=1
pkgdesc="Backport of the KDE4 version of kio-sftp to KDE 2"
arch=(i686 x86_64)
url="https://github.com/sandsmark/kde2-${_module}"
license=("GPL2")
groups=(kde2)
depends=(kde2-kdelibs-git libssh)
makedepends=(cmake git)
provides=(kde2-${_module} kde2-kio-sftp)
conflicts=(kde2-${_module} kde2-kio-sftp)
options+=(libtool)

# Mirror
source=("git+https://github.com/sandsmark/kde2-${_module}.git")

md5sums=('SKIP')

pkgver() {
  cd kde2-${_module}
  printf "2.2.2.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  if [[ -d build ]]; then
    rm -rf build && mkdir build
  else
    mkdir build
  fi

  cd kde2-${_module}
}

build() {
  cd build
  cmake "$srcdir"/kde2-${_module} -DCMAKE_INSTALL_PREFIX=/usr -DKDEDIR=/usr/
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
  cd "$srcdir"/kde2-${_module}
}
