# Maintainer: BlackDragon2447 <blackdragon2447@e.email>
pkgname='leftwm-config-git'
pkgver=r26.30a255b
pkgrel=3
pkgdesc="Config manager for LeftWM"
arch=('i686' 'x86_64')
url="https://github.com/leftwm/leftwm-config"
license=('BSD')
depends=('leftwm')
makedepends=('git' 'cargo') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("leftwm-config")
conflicts=("leftwm-config")
source=("${pkgname}::git+https://github.com/leftwm/leftwm-config.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  cargo +stable build --release
}

package() {
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" $srcdir/$pkgname/LICENCE
  cd "$srcdir/$pkgname/target/release"
  install -Dm755 -t "${pkgdir}/usr/bin" leftwm-config
}
