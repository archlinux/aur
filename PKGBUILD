# Maintainer: 2ion <dev at 2ion dot de>
pkgname=bash-ctypes-git
pkgver=r12.7cded42
pkgrel=1
pkgdesc="Foreign Function Interface for Bash"
arch=('x86_64' 'i686')
url="https://github.com/taviso/ctypes.sh"
license=('MIT')
depends=('bash' 'libffi')
makedepends=('git' 'libffi' 'pkg-config')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(\
  'bash-ctypes::git+https://github.com/taviso/ctypes.sh#branch=master'\
  'archlinux-pkgconfig.patch'\
  'ctypes_bash_profile.sh')
md5sums=(\
  'SKIP'\
  'd62e880683bab33be4d845602d77f237'\
  '8f94ef9e242b89d5ea860527e2595f2c')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  patch -p1 -i "$srcdir/archlinux-pkgconfig.patch"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -Dm755 ctypes.sh "${pkgdir}/usr/bin/ctypes.sh"
  install -Dm755 ctypes.so "${pkgdir}/usr/lib/ctypes.so"
  install -Dm755 "${srcdir}/ctypes_bash_profile.sh" "${pkgdir}/etc/profile.d/ctypes.sh"
}
