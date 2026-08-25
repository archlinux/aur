# Maintainer: Shayne Hartford <shaybox@shaybox.com>

_pkgname=sfp
pkgname="${_pkgname}-ui-bin"
pkgver=0.0.72
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
sha512sums=('029c74e5bd483941062b677ee709e4c159f9465e907bec3fd7a03f0bbaf0cf5fcf23315a39fdce7fbda28e0f97298088c87c338c3655a8ee6eefc5f70d408e33'
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
