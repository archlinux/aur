# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# COntributor: haxibami <contact at haxibami dot net>

pkgname=ctrld-bin
pkgver=1.4.8
pkgrel=1
pkgdesc="A highly configurable, multi-protocol DNS forwarding proxy"
arch=('x86_64')
url="https://github.com/Control-D-Inc/ctrld"
_urlraw="https://raw.githubusercontent.com/Control-D-Inc/ctrld/v${pkgver}"
license=('MIT')
provides=('ctrld')
backup=('etc/controld/ctrld.toml')
options=(!strip)
source=(
        "${url}/releases/download/v${pkgver}/ctrld_${pkgver}_linux_amd64.tar.gz"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "ctrld.service"
        "ctrld.toml"
)
sha256sums=('2e11b57266ce9b0697a7e2809b99139924e5a6e20e0282ccbadcf0a1b7c7f36c'
            '631bf4ef5820d83e359f84b8bdba8e7eb0dc29cae5071f4e6f3d54b23e33e736'
            'c8d4e7d3c2bfb448e6a03046456a9039e2b406592cddd939931c638ab47f01de'
            '0b1dd36bc9706f88949de821d84604cbc9a2534cd2f627ef5303bfc962af72cd'
            '40328c166a329b47072593998170544084725a47e20989be242bbc137d91cd0a')

package() {
  cd "${srcdir}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  cd "${srcdir}/dist/ctrld_${pkgver}_linux_amd64"

  install -Dm755 ctrld "${pkgdir}/usr/bin/ctrld"

  install -Dm644 "${srcdir}/ctrld.toml" "${pkgdir}/etc/controld/ctrld.toml"

  install -Dm644 "${srcdir}/ctrld.service" "${pkgdir}/usr/lib/systemd/system/ctrld.service"
}
