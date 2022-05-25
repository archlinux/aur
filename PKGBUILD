# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Chris Brannon <chris@the-brannons.com>
# Contributor: Paulo Matias <matiasΘarchlinux-br·org>
# Contributor: Anders Bergh <anders1@gmail.com>

pkgname=lib32-luajit
# LuaJIT has abandoned versioned releases and now advises using git HEAD
# https://github.com/LuaJIT/LuaJIT/issues/665#issuecomment-784452583
_commit=4ef96cff887c268cc676f9b4b1dc9c54a693efd5
pkgver="2.1.0.beta3.r407.g${_commit::8}"
pkgrel=1
pkgdesc='Just-in-time compiler and drop-in replacement for Lua 5.1 (32-bit)'
arch=('x86_64')
url="https://luajit.org/"
license=('MIT')
depends=('lib32-gcc-libs' 'luajit')
source=("LuaJIT-${_commit}.tar.gz::https://repo.or.cz/luajit-2.0.git/snapshot/${_commit}.tar.gz")
sha256sums=('7bda0f33f411f0c274257c6c6acc0e3820bfa245ff73dc9e3ba7f6deced89c8e')

build() {
  cd "luajit-2.0-${_commit::7}"
  make amalg CFLAGS="-m32" CXXFLAGS="-m32" LDFLAGS="-m32" MULTILIB="lib32" PREFIX="/usr"
}

package() {
  cd "luajit-2.0-${_commit::7}"
  make install DESTDIR="$pkgdir" MULTILIB="lib32" PREFIX="/usr"
  rm -r "$pkgdir/usr/"{bin,share,include}
}

