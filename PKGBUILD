# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>

pkgname=cherrytree-git
pkgver=1.0.2.r39.gb88cf6eb
pkgrel=1
pkgdesc="Hierarchical note-taking application, git version"
arch=('x86_64')
url="https://github.com/giuspen/${pkgname%%-git}"
license=('GPL3')
depends=('fmt'
         'gspell'
		 'gtksourceviewmm'
		 'libxml++2.6'
		 'uchardet'
		 'vte3')
makedepends=('cmake'
			 'git'
			 'python'
             'spdlog')
checkdepends=('gtest')
provides=("${pkgname%%-git}")
conflicts=("${pkgname%%-git}")
source=("git+https://github.com/giuspen/${pkgname%%-git}.git")
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname%%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

build() {
  cmake \
	-B "${pkgname%%-git}/build" \
	-S "${pkgname%%-git}" \
	-DAUTO_RUN_TESTING:BOOL='OFF' \
	-DUSE_SHARED_GTEST_GMOCK:BOOL='ON' \
	-Wno-dev
  make -C "${pkgname%%-git}/build"
}

check() {
  ./"${pkgname%%-git}/build/run_tests_no_x"
}

package() {
  make -C "${pkgname%%-git}/build" DESTDIR="${pkgdir}" install
}
