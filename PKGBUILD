# Maintainer: <me at auoeke dot net>
pkgname=circle
_build=$(curl https://www.circle-lang.org/linux/ | grep -Po '(?<=build_)\d+(?=\.tgz)' | sort -h | tail -1)
pkgver=1.0.0_$_build
pkgrel=1
pkgdesc='a C++ compiler with many novel language features'
arch=(x86_64)
url=https://circle-lang.org
license=(custom)
depends=('gcc>=10.2')
source=(https://www.circle-lang.org/linux/build_$_build.tgz)
sha256sums=('c1143e5e0f4768f45d929121c03f5b121da8026642436efb11d12421068da953')

check() {
    ./circle sanity.cxx
    ./sanity
}

package() {
    install -Dm 755 circle "${pkgdir}/usr/bin/circle"
    install -Dm 664 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}

