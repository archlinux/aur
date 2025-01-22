# Maintainer: Gustavo Ramos Rehermann (wallabra) <rehermann6046@gmail.com>
pkgname=nuvie-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=
pkgrel=1
pkgdesc="A modern open-source engine for Ultima 6, Martian Dreams, and Savage Empire"
arch=(x86_64)
url="https://github.com/nuvie/nuvie"
license=('GPL-2.0-only')
groups=()
depends=()
makedepends=('git' cmake) # 'bzr', 'git', 'mercurial' or 'subversion'
provides=(ultima6)
conflicts=(nuvie)
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/nuvie/nuvie.git')
noextract=()
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	# cd "$srcdir/${pkgname%-git}"
	# patch -p1 -i "$srcdir/${pkgname%-git}.patch"
}

build() {
  local cmake_options=(
    -B build
    -S $pkgname-$pkgver
    -W no-dev
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

check() {
  # local excluded_tests=""
  # local ctest_flags=(
  #   --test-dir build
  #   # show the stdout and stderr when the test fails
  #   --output-on-failure
  #   # execute tests in parallel
  #   --parallel $(nproc)
  #   # exclude problematic tests
  #   --exclude-regex "$excluded_tests"
  # )
  # ctest "${ctest_flags[@]}"
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
