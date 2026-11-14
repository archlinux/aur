# Maintainer: Eternal_night <learnzwk@gmail.com>
pkgname=dsh-next-bin
pkgver=2.0.23_next
pkgrel=1
pkgdesc="DSH Desktop NEXT - desktop client for DeepSeek Harness"
arch=('x86_64')
options=('!strip' '!debug')
url="https://github.com/anywhere-labs/dsh-desktop"
license=('custom')

depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'at-spi2-core' 'xdg-utils' 'util-linux' 'libsecret' 'mesa' 'alsa-lib')

source_x86_64=("${url}/releases/download/v${pkgver//_/-}/DSH-NEXT-${pkgver//_/-}-amd64.deb")
sha256sums_x86_64=('44e224d31e7f6af8f4b2b75ffcb8a88ca4657cc6a9efac085bf4a39d1372b7a2')

package() {
    ar x "${srcdir}/DSH-NEXT-${pkgver//_/-}-amd64.deb"
    bsdtar -xf data.tar.* -C "${pkgdir}"

    mv "${pkgdir}/opt/DSH NEXT" "${pkgdir}/opt/dsh-desktop-next"

    local _desktop="${pkgdir}/usr/share/applications/dsh-desktop-next.desktop"
    if [ -f "${_desktop}" ]; then
        sed -i 's|/opt/DSH NEXT|/opt/dsh-desktop-next|g' "${_desktop}"
    fi
}
