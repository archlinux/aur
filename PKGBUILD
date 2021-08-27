# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Xiaoxu Guo <ftiasch0@gmail.com>
pkgname=testlib-git
pkgver=r229.f28d528
pkgrel=1
epoch=
pkgdesc="C++ implementation of the testlib used on many programming contests in Russia (Russian National Olympiad in Informatics, different stages of ACM-ICPC)."
arch=('any')
url="https://github.com/MikeMirzayanov/testlib"
license=('MIT')
groups=()
depends=()
makedepends=('git')
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}::git+https://github.com/MikeMirzayanov/testlib.git")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgname}"
  install -D -m644 testlib.h $pkgdir/usr/include/testlib.h
  # Copy auxiliary files
  for component in checkers generators interactors validators; do
    target_dir=${pkgdir}/usr/share/testlib/${component}
    mkdir -p ${target_dir}
    install -m644 -t ${target_dir} ${component}/*.cpp
  done
}
