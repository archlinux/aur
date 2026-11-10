# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=pkg-revolve
pkgname=revolve
pkgver=20201003
pkgrel=1
pkgdesc="Optimal checkpointing schedules for adjoint computations (PETSc's fork of Revolve)"
arch=('x86_64')
url="https://bitbucket.org/caidao22/$_name"
license=('CPL-1.0')
depends=('glibc'
         'libgcc'
         'libstdc++')
_commit=40a0ea2a36058b9ae94920b9479c856371935276
source=("$pkgname-$pkgver.tar.gz::$url/get/$_commit.tar.gz")
sha256sums=('8fdbe164d677621e529fe3d5d9123969fc1f30a5606a8fa5bbd1d73b9c101769')

build() {
  cd "caidao22-$_name-${_commit::12}"
  g++ $CXXFLAGS -fPIC -c revolve.cxx revolve_c.cxx
  g++ $CXXFLAGS $LDFLAGS -shared -Wl,-soname,lib$pkgname.so -o lib$pkgname.so revolve.o revolve_c.o
}

package() {
  cd "caidao22-$_name-${_commit::12}"
  install -Dm755 lib$pkgname.so -t "$pkgdir"/usr/lib/
  install -Dm644 revolve.h revolve_c.h -t "$pkgdir"/usr/include/
}
