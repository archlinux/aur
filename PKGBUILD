# Maintainer: Tomasz Pakula <forest10pl@gmail.com>
_reponame=universal-pidff
pkgname=$_reponame-dkms-git
provides=($_reponame-dkms)
pkgver=0.0.4
pkgrel=1
pkgdesc="Universal FFB Driver for Moza/Cammus/VRS and more"
arch=('x86_64')
url="https://github.com/JacKeTUs/$_reponame"
license=('GPL2')
depends=(dkms)
makedepends=(
  git
  gcc
  glibc
)
source=(
  git+https://github.com/JacKeTUs/$_reponame
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "$srcdir/$_reponame"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_reponame"

  find . -type f \( -name 'dkms.conf' -o -name '*.c' \) -exec sed -i "s/#VERSION#/$pkgver/" {} +

  echo "* Copying module into /usr/src..."
  install -dm755 "${pkgdir}/usr/src/universal-pidff-${pkgver}"
  cp -r ${srcdir}/$_reponame/* "${pkgdir}/usr/src/universal-pidff-${pkgver}"
}
