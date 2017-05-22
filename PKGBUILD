pkgname=pbs-git
pkgver=r13.15ba7a3
pkgrel=1
pkgdesc="less styles for pb"
arch=('any')
url="https://github.com/ptpb/pbs"
license=('GPLv3')

makedepends=('libxml2' 'git' 'npm' 'grunt-cli' 'graphicsmagick')

provides=('pbs')

source=("$pkgname::git+https://github.com/ptpb/pbs.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $pkgname

  npm install
  grunt
}

package() {
  cd $pkgname

  for resource in css images js; do
    install -D -m755 -d "${pkgdir}/usr/share/pbs/${resource}"
    install -D -m644 dist/$resource/* "${pkgdir}/usr/share/pbs/${resource}"
  done
}
