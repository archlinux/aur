# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_name=hcxlabtool
pkgname=$_name-git
pkgver=r347.51ad69e
pkgrel=1
pkgdesc="NL80211 / RTNETLINK fork of hcxdumptool"
arch=(x86_64)
url="https://github.com/ZerBea/wifi_laboratory"
license=(MIT)
depends=('glibc')
makedepends=('git')
options=(!debug)
source=('hcxlabtool::git+https://github.com/ZerBea/wifi_laboratory')
b2sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_name}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}


build() {
    cd "${srcdir}/${_name}"
    gcc $CFLAGS -o hcxlabtool hcxlabtool.c $LDFLAGS
}

package() {
    cd "${srcdir}/${_name}"
    install -Dm 755 ${_name} -t "${pkgdir}/usr/bin/"
    install -Dm 644 license.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
