# Maintainer: Fancy Zhang <springzfx@gmail.com>
pkgbase=cgproxy
pkgname=cgproxy-git
pkgver=v3.6.r5.gd3b2dc0
pkgrel=1
pkgdesc="A transparent proxy program with cgroup2, like proxychains"
arch=('x86_64')
url="https://github.com/springzfx/cgproxy"
license=('')
groups=('')
makedepends=('cmake')
depends=('systemd')
options=('!strip' '!emptydirs')
source=("${pkgname}::git+https://github.com/springzfx/cgproxy#branch=master")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

backup=('etc/cgproxy.conf')

build(){
    cd "$pkgname"
    mkdir -p build && cd build && cmake .. && make 
}
package_cgproxy-git(){
    cd "$pkgname"/build
    make DESTDIR=$pkgdir install 
}

