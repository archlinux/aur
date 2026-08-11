# Maintainer: Shayne Hartford <shaybox@shaybox.com>

_pkgname=sfp
pkgname="${_pkgname}-ui-bin"
pkgver=0.0.71
pkgrel=1
pkgdesc="This utility is designed to allow you to apply skins to the modern Steam client"
arch=("x86_64")
url="https://github.com/PhantomGamers/${_pkgname}"
license=("MIT")
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=("!strip" "!debug") # Upstream ships a stripped single-file binary.
depends=("gcc-libs" "glibc" "ttf-ms-fonts")
_asset="SFP_UI-linux-x64-SelfContained.tar.gz"
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/releases/download/${pkgver}/${_asset}"
  "LICENSE::https://raw.githubusercontent.com/PhantomGamers/SFP/${pkgver}/LICENSE"
)
sha512sums=('849b3579a3cb4130d0a16b0c1c90ba457a17e4525c139121e42c44172d078069b54f8db2c10cb7fb283e567e19a5d31748623475d435bec300530537ef9d395c'
            'ffe34abde4b646b64e5871867c106d29cad7987839b756a2a80d7cb8423e71b2f307214631637d96e702aa6fed0ebf755582fa2a96c77430acfe0f383e5f9840')

latestver() {
  gh api --paginate repos/PhantomGamers/SFP/releases --jq \
    '.[] | select(.prerelease == false and .draft == false and any(.assets[]; .name == "SFP_UI-linux-x64-SelfContained.tar.gz")) | .tag_name' |
    head -1 | sed 's/^v//'
}

package() {
  install -Dm755 "${srcdir}/SFP_UI" "${pkgdir}/usr/bin/SFP_UI"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
