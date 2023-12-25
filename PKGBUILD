# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Chris Brannon <chris@the-brannons.com>
# Contributor: Paulo Matias <matiasΘarchlinux-br·org>
# Contributor: Anders Bergh <anders1@gmail.com>

pkgname=lib32-luajit
# LuaJIT has a "rolling release" where you should follow git HEAD
_commit=ff204d0350575cf710f6f4af982db146cb454e1a
# The patch version is the timestamp of the above git commit, obtain via `git show -s --format=%ct`
_ct=1702233742
pkgver="2.1.${_ct}"
pkgrel=1
pkgdesc='Just-in-time compiler and drop-in replacement for Lua 5.1 (32-bit)'
arch=('x86_64')
url="https://luajit.org/"
license=('MIT')
depends=('lib32-gcc-libs' 'luajit')
source=("LuaJIT-${_commit}.tar.gz::https://github.com/LuaJIT/LuaJIT/archive/${_commit}.tar.gz")
sha256sums=('3ec37f78ab3b1afd4c3af0fde743c332da3da32eadc8500489c1cc2e4f0ec7eb')

build() {
  cd "LuaJIT-${_commit}"
  # Avoid early stripping
  make amalg \
    CFLAGS="-m32" CXXFLAGS="-m32" LDFLAGS="-m32" MULTILIB="lib32" \
    PREFIX="/usr" BUILDMODE="dynamic" TARGET_STRIP=" @:"
}

package() {
  cd "LuaJIT-${_commit}"
  make install DESTDIR="$pkgdir" MULTILIB="lib32" PREFIX="/usr"
  rm -r "$pkgdir/usr/"{bin,share,include}
}

