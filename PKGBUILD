# Maintainer: Andrew Sun <adsun701@gmail.com>
# Maintainer: Maxim Klimenko <ghosyintheshell@gmail.com>

_pkgname=autovpn
pkgname=${_pkgname}-git
pkgver=r20.a2d4278
pkgrel=1
pkgdesc='Easily connect to a VPN in a country of your choice.'
arch=('x86_64')
url="https://github.com/scry3r/autovpn.git"
license=('GPL')
depends=('openvpn')
makedepends=('go' 'go-pie')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=('git+https://github.com/scry3r/autovpn.git')
md5sums=('SKIP')

pkgver() {
        cd "$srcdir/${_pkgname}"
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
        cd "$srcdir/${_pkgname}"
        go build -o ${_pkgname}
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -Dm755 ${_pkgname} "$pkgdir/usr/bin/${_pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}/" README.md
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
