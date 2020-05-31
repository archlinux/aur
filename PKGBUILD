# Maintainer: Fancy Zhang <springzfx@gmail.com>
pkgname=cgproxy
pkgver=v0.15
pkgrel=1
pkgdesc="A transparent proxy program powered by cgroup2 and tproxy"
arch=('x86_64')
url="https://github.com/springzfx/cgproxy"
license=('GPL')
groups=('')
makedepends=('cmake' 'nlohmann-json' 'bcc')
depends=()
optdepends=('systemd: service manager'
            'bcc: execsnoop for program_proxy/program_noproxy'
            'linux-headers: bcc init')
provides=('cgproxy')
conflicts=('cgproxy')

source=("${pkgname}::git+https://github.com/springzfx/cgproxy#tag=${pkgver}")
md5sums=('SKIP')

backup=('etc/cgproxy/config.json')
install='cgproxy.install'

build(){
    cd "$pkgname"
    mkdir -p build && cd build && cmake .. && make 
}

package_cgproxy(){
    cd "$pkgname"/build
    make DESTDIR=$pkgdir install 
}

