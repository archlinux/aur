# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Chris Brannon <chris@the-brannons.com>
# Contributor: Paulo Matias <matiasΘarchlinux-br·org>
# Contributor: Anders Bergh <anders1@gmail.com>

pkgname=lib32-luajit
# LuaJIT has abandoned versioned releases and now advises using git HEAD
# https://github.com/LuaJIT/LuaJIT/issues/665#issuecomment-784452583
_commit=8625eee71f16a3a780ec92bc303c17456efc7fb3
pkgver="2.1.0.beta3.r464.g${_commit::8}"
pkgrel=1
pkgdesc='Just-in-time compiler and drop-in replacement for Lua 5.1 (32-bit)'
arch=('x86_64')
url="https://luajit.org/"
license=('MIT')
depends=('lib32-gcc-libs' 'luajit')
source=("LuaJIT-${_commit}.tar.gz::https://repo.or.cz/luajit-2.0.git/snapshot/${_commit}.tar.gz")
sha256sums=('6e323e414b0cddf4b7dd7605c435ab62f136a2b1ca0afbd1ced781950c6923a1')

build() {
  cd "luajit-2.0-${_commit::7}"
  # Avoid early stripping
  make amalg \
    CFLAGS="-m32" CXXFLAGS="-m32" LDFLAGS="-m32" MULTILIB="lib32" \
    PREFIX="/usr" BUILDMODE="dynamic" TARGET_STRIP=" @:"
}

package() {
  cd "luajit-2.0-${_commit::7}"
  make install DESTDIR="$pkgdir" MULTILIB="lib32" PREFIX="/usr"
  rm -r "$pkgdir/usr/"{bin,share,include}
}

