# Contributor: Camille <onodera@rizon>
# Contributor: Alad <alad@archlinux.info>
# Contributor: Ferdi265 <theferdi265@gmail.com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=libwm-git
pkgver=1.0.r1.ae47478
pkgrel=1
pkgdesc="A set of tools for X windows manipulation."
url="https://github.com/wmutils/core"
arch=('i686' 'x86_64')
license=('ISC')
depends=('libxcb' 'xcb-util-wm')
source=("$pkgname::git+https://github.com/wmutils/libwm.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed -r 's/^v//g;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  prefix="/usr"
  manprefix="$prefix/share/man"
  licenseprefix="/usr"
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" PREFIX="$prefix" MANPREFIX="$manprefix" install
  install -Dm644 LICENSE $pkgdir/$licenseprefix/share/licenses/$pkgname/LICENSE
}

