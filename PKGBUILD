# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other git sources are not natively supported by makepkg yet.

# Maintainer: Xiaoxu Guo <ftiasch0@gmail.com>
pkgname=testlib-git
pkgver=r444.9ecb111
pkgrel=1
pkgdesc='C++ implementation of the testlib used on many programming contests in Russia (Russian National Olympiad in Informatics, different stages of ACM-ICPC).'
arch=('any')
url='https://github.com/MikeMirzayanov/testlib'
license=('GPL')
groups=()
depends=()
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
replaces=()
backup=()
options=()
install=
source=("${pkgname%-git}::git+https://github.com/MikeMirzayanov/testlib.git")
noextract=()
md5sums=('SKIP')

# Please refer to the 'USING git SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
  cd "$srcdir/${pkgname%-git}"

# Git, no tags available
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgname%-git}"
  install -D -m644 testlib.h $pkgdir/usr/include/testlib.h
  # Copy auxiliary files
  for component in checkers generators interactors validators; do
    target_dir=${pkgdir}/usr/share/testlib/${component}
    mkdir -p ${target_dir}
    install -m644 -t ${target_dir} ${component}/*.cpp
  done
}
