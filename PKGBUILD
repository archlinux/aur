# Maintainer: Danilo Kuehn <dk[at]nogo-software[dot]de>

_name=packer
pkgname=packer-io
pkgver=0.10.0
pkgrel=1
pkgdesc="Packer is a tool for creating identical machine images for multiple platforms from a single source configuration."
url="http://www.packer.io"
arch=('x86_64' 'i686')
license=('MPL2')
depends=(unzip)
optdepends=()
conflicts=()
if test "$CARCH" == i686; then
source=("${_name}-${pkgver}.zip::https://releases.hashicorp.com/packer/${pkgver}/packer_${pkgver}_linux_386.zip")
sha256sums=('0d2460f645e73e070cb203e540b64624027f27d82268f7d939898af1c358abaf')
else
source=("${_name}-${pkgver}.zip::https://releases.hashicorp.com/packer/${pkgver}/packer_${pkgver}_linux_amd64.zip")
sha256sums=('eadd33bc0f8fa42034059fc1cda5f43ed6f540746e767480f0706ebed49b45e5')
fi
noextract=(${source[@]%%::*})

prepare() {
  if [[ -e ${srcdir}/${_name}-${pkgver} ]]; then rm -rf ${srcdir}/${_name}-${pkgver}; fi
  mkdir ${srcdir}/${_name}-${pkgver}
  unzip -o ${_name}-${pkgver}.zip -d ${srcdir}/${_name}-${pkgver}
}

package() {
  install -dm755 "${pkgdir}/usr/bin"

  cd "${srcdir}/${_name}-${pkgver}"
  for file in `ls ${srcdir}/${_name}-${pkgver}`; do
    if [ "$file" == "packer" ]; then
      install -Dm755 "$file" "${pkgdir}/usr/bin/${file}-io"
    else
      install -Dm755 "$file" "${pkgdir}/usr/bin/${file}"
    fi
  done
}
