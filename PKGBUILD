# Maintainer: Ren Tatsumoto <tatsu at autistici dot org>

pkgname=impd-git
pkgver=0.1.r1.g1211089
pkgrel=1
pkgdesc="Manage passive immersion and create condensed audio."
arch=(any)
url="https://github.com/Ajatt-Tools/impd"
license=("GPL3")
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname}"
  make
}

package() {
  cd "${pkgname}"
  make DESTDIR="${pkgdir}" install
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
