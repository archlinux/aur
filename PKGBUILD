# Maintainer: Serge K <arch@phnx47.net>

# For Issues, Pull Requests
# https://github.com/phnx47/pkgbuilds

_pkgname=ledger-udev
pkgname="${_pkgname}-git"
pkgver=r14.9bf0cbb
pkgrel=1
pkgdesc='Udev rules to support Ledger devices on Linux (git-latest)'
arch=('any')
url='https://github.com/LedgerHQ/udev-rules'
license=('Apache')
depends=('udev')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
install="${_pkgname}.install"
source=("${pkgname}::git+${url}"
        "add_udev_rules.patch")
sha512sums=('SKIP'
            'e0f82a8fe257cba13585d926e3633efb8c219853bea4b1d018fee9f5469a72a0d05695760718cece0a9a9cbaa0da12441f05ff33ba53a293d3ffca3b384e025c')

prepare() {
  cd "${pkgname}"
  patch -p0 -i "${srcdir}/add_udev_rules.patch"
  ./add_udev_rules.sh
}

package() {
  cd "${pkgname}"
  install -Dm 644 "20-hw1.rules" "${pkgdir}/usr/lib/udev/rules.d/20-hw1.rules"
}

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
