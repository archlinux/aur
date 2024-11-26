# Template: https://aur.archlinux.org/packages/hidpp-logitech-g-pro-wheel-dkms-git
# Maintainer: fridtjof <fridtjof@das-labor.org>
_reponame=hid-logitech-dj
pkgname=hid-logitech-dj-lightspeed12-dkms-git
pkgver=0.2.r2.g26a28b0
pkgrel=2
pkgdesc="hid-logitech-dj with G502 X Plus (and others) support"
arch=('x86_64')
url="https://github.com/fridtjof/hid-logitech-dj"
license=('GPL2')
depends=(dkms)
makedepends=(
  git
  gcc
  glibc
)
source=(
  'git+https://github.com/fridtjof/hid-logitech-dj'
)
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_reponame"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_reponame"

  find . -type f \( -name 'dkms.conf' -o -name '*.c' \) -exec sed -i "s/#VERSION#/$pkgver/" {} +
  #echo 'ccflags-y += -DDEBUG' >> "Kbuild"

  echo "* Copying module into /usr/src..."
  install -dm755 "${pkgdir}/usr/src/${_reponame}-${pkgver}"
  cp -r ${srcdir}/$_reponame/* "${pkgdir}/usr/src/${_reponame}-${pkgver}"
}
