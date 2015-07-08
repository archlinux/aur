# Maintainer: maz-1 <loveayawaka at  gmail dot com>
pkgname=onedrive-fuse-fs-git
pkgver=r16.d3061d5
pkgrel=1
pkgdesc="Script to mount Microsoft OneDrive (formerly known as SkyDrive) folder as a FUSE filesystem."
arch=('any')
url="https://github.com/mk-fg/onedrive-fuse-fs"
license=('WTFPL')
depends=('python2' 'python2-onedrive-git' 'python2-fusepy-git')
makedepends=('git')
provides=('onedrive-fuse-fs')
conflicts=('onedrive-fuse-fs')
options=(!emptydirs)
source=("$pkgname"::'git://github.com/mk-fg/onedrive-fuse-fs.git')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"
  sed -i -e "s|^#!/usr/bin/env python|#!/usr/bin/env python2|" \
            ./onedrivefs
  install -Dm 755 ./onedrivefs ${pkgdir}/usr/bin/onedrivefs
  install -Dm 644 ./COPYING ${pkgdir}/usr/share/doc/${pkgname}/COPYING
  install -Dm 644 ./README.md ${pkgdir}/usr/share/doc/${pkgname}/README.md
}

