# Maintainer: Timofey Titovets <nefelim4ag@gmail.com>

pkgname=compsize-git
pkgver=r12.acace51
pkgrel=1
pkgdesc="Btrfs: find compression type/ratio on a file or set of files"
arch=('any')
url="https://github.com/kilobyte/compsize"
#license=('GPL2')
#depends=('systemd' 'bash' 'schedtool')
makedepends=('gcc' 'git')
source=("$pkgname"::'git://github.com/kilobyte/compsize.git#branch=master')
md5sums=('SKIP')
#install=$pkgname.install

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build(){
        cd "$srcdir/${pkgname}/"
        make
}

package() {
        install -Dm755 \
                "${srcdir}/${pkgname}/compsize" \
                "${pkgdir}/usr/bin/compsize"
}
