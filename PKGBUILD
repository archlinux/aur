# Maintainer: Rayshawn Levy <sneekyfoxx09@gmail.com>
# Maintained at https://github.com/sneekyfoxx/Superuser, feel free to submit patches

pkgname=superuser
pkgver=1
pkgrel=1
_pyver=1
_pybasever=1
_pymajver=1
pkgdesc="A shell utility that bundles custom built versions of five common shell utilities."
arch=('x86_64')
license=('GPL-3.0')
url="https://github.com/sneekyfoxx/Superuser"
depends=('musl')
makedepends=('musl')
optdepends=('upx>=4.2.4')
source=(Superuser::git+"https://github.com/sneekyfoxx/Superuser.git")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/Superuser"
  
  "${srcdir}/Superuser/install-nim.sh"

  if [ ! -d "${HOME}/.local/bin" ]; then
    mkdir "${HOME}/.local/bin";
  fi

  mkdir "${srcdir}/Superuser/bin"
}

build() {
  cd "${srcdir}/Superuser"

  "${srcdir}/Superuser/build.sh" -c
}

package() {
  cd "${pkgdir}"

  install -m755 "${srcdir}/Superuser/bin/superuser" "/usr/bin/superuser"
}
