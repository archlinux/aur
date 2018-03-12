# Maintainer: Bart Verhagen <barrie.verhagen at gmail dot com>
pkgname=('catch2')
pkgbase='catch2'
pkgver=v2.2.1_0_g0a34cc20
pkgrel=1
epoch=
pkgdesc="A modern, C++-native, header-only, test framework for unit-tests, TDD and BDD - using C++11, C++14, C++17 and later"
arch=('any')
url="https://github.com/catchorg/catch2"
license=('boost')
groups=()
depends=()
makedepends=(cmake make git)
checkdepends=()
optdepends=()
provides=('catch2=v2.2.1_0_g0a34cc20')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=catch2.changelog
source=('catch2::git+https://github.com/catchorg/Catch2.git#commit=0a34cc201ef28bf25c88b0062f331369596cb7b7')
noextract=()
validpgpkeys=()

_git_dir='catch2'
_build_dir='build'

_exec_helper_build_targets=('all')

_test_binary='SelfTest'
_exec_helper_test_targets=(${_test_binary})

pkgver() {
    printf "%s" $pkgver
}

build() {
    cmake -G "Unix Makefiles" -H"$_git_dir" -B"$_build_dir" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="$pkgdir/usr/" -DCMAKE_INSTALL_LIBDIR="lib" -DCATCH_USE_VALGRIND=OFF -DCATCH_BUILD_EXAMPLES=OFF -DCATCH_ENABLE_COVERAGE=OFF -DCATCH_ENABLE_WERROR=OFF -DBUILD_TESTING=OFF
    make --directory "$_build_dir" ${_exec_helper_build_targets[@]}
}

check() {
    cmake -G "Unix Makefiles" -H"$_git_dir" -B"$_build_dir" -DBUILD_TESTING=ON
    make --directory "$_build_dir" ${_exec_helper_test_targets[@]}

    $_build_dir/${_test_binary}
}

package_catch2() {
    cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" -P "$_build_dir/cmake_install.cmake" 
}

md5sums=('SKIP')
