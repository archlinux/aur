# Maintainer: 
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org>
# Contributor: navigaid <navigaid@gmail.com>
# Contributor: shi liang <shiliang2008@msn.com>

pkgname=naiveproxy-git
pkgver=114.0.5735.91.4test.r0.g4b250049a
pkgrel=1
pkgdesc="Make a fortune quietly"
arch=(x86_64)
url="https://github.com/klzgrad/naiveproxy"
license=(BSD)
depends=(gcc-libs glibc)
makedepends=(git python unzip ninja)
provides=(naiveproxy)
conflicts=(naiveproxy)
backup=(etc/naiveproxy/config.json)
source=("git+https://github.com/klzgrad/naiveproxy.git"
        'naiveproxy.service')
sha256sums=('SKIP'
            '90176b9a4d92157dfba0e18b95e7eef4babda0db3448389b8e9142d971d72d7a')

prepare() {
  cd naiveproxy/src
  chmod a+x build.sh
  ./get-clang.sh
}

pkgver() {
  cd naiveproxy
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
  cd naiveproxy/src
  ./build.sh
}

package(){
  install -Dm 0644 -o root "naiveproxy.service" -t "${pkgdir}/usr/lib/systemd/system/"
  cd naiveproxy
  install -Dm755 src/out/Release/naive ${pkgdir}/usr/bin/naive
  install -Dm644 src/config.json ${pkgdir}/etc/naiveproxy/config.json
  install -Dm644 README.md ${pkgdir}/usr/share/doc/naiveproxy/README.md
  install -Dm644 USAGE.txt ${pkgdir}/usr/share/doc/naiveproxy/USAGE.txt
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
