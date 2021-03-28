pkgname=plasma5-applets-systemloadviewer
pkgver=5.20.80
pkgrel=1
pkgdesc="Deprecated Plasma 5 plasmoid for monitoring system load. I preserved it as I prefer to use this plasmoid."
arch=('x86_64')
license=('GPL3')
depends=('plasma-workspace' 'libcanberra-pulse' 'pulseaudio' 'perl')
optdepends=()
makedepends=('extra-cmake-modules' 'kdoctools' 'kross')
source=(git+https://invent.kde.org/plasma/kdeplasma-addons#commit=62730341432d3abf203ea5d2f5583cd5a0b64123 limit-to-only-target.patch)
md5sums=('SKIP' 'SKIP')
        
prepare()
{
  cd kdeplasma-addons
  patch --strip=1 --input="$srcdir"/limit-to-only-target.patch
}
        
build()
{
pwd
  cmake -B build -S kdeplasma-addons \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package()
{
  DESTDIR="$pkgdir" cmake --install build
}
