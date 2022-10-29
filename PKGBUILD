# Maintainer: Shayne Hartford<shayneehartford@gmail.com>
pkgname=nvflash
pkgver=5.792
pkgrel=1
pkgdesc="A tool to update the the firmware of Nvidia display adapters."
url="https://www.techpowerup.com/download/nvidia-nvflash/"
arch=('x86_64' 'i686' 'aarch64')
license=('unknown')
makedepends=('wget' 'unzip')

build() {
    wget \
    --method POST \
    --header 'content-type: application/x-www-form-urlencoded' \
    --body-data 'id=2271&server_id=3' \
    --output-document="${pkgname}-${pkgver}.zip" \
    - "${url}" || true
    
    unzip -o "${pkgname}-${pkgver}.zip"
}

package() {
    subd=$(echo "${arch}" | sed "s/x86_64/x64/")
    subd=$(echo "${subd}" | sed "s/i686/x32/")
    install -Dm755 "${srcdir}/${subd}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
