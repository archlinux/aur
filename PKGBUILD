# Maintainer: aksr <aksr at t-com dot me>
pkgname=fswatch-git
pkgver=1.11.2.r108.g2b810f0
pkgrel=1
epoch=
pkgdesc="A file change monitor that receives notifications when the contents of the specified files or directories are modified."
arch=('i686' 'x86_64')
url="https://github.com/emcrisostomo/fswatch"
url="https://emcrisostomo.github.io/fswatch/"
license=('GPLv3')
groups=()
depends=()
makedepends=('git')
optdepends=()
checkdepends=()
provides=('fswatch')
conflicts=('fswatch')
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/emcrisostomo/fswatch.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$pkgname"
  make -k check
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
  mkdir -p $pkgdir/usr/share/licenses/${pkgname%-*}
  cd $pkgdir/usr/share/doc/${pkgname%-*}
  rm {ABOUT-NLS,AUTHORS,AUTHORS.libfswatch,CONTRIBUTING.md,NEWS,NEWS.libfswatch}
  rm README.{bsd,codestyle,freebsd,gnu-build-system,illumos,osx,smartos,solaris,windows}
  mv COPYING $pkgdir/usr/share/licenses/${pkgname%-*}/COPYING
}

