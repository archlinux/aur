# Maintainer: Nero Blackstone <gf7600gs@gmail.com>

pkgname=youzone
pkgver=8.1.0
pkgrel=1
pkgdesc="友空间，更懂企业的一体化数智办公平台。Youzone, an integrated digital office platform that better understands enterprises."
arch=('x86_64')
url="https://ec.diwork.com/index.html"
license=('custom:proprietary')
makedepends=(jq curl)
source=()
sha256sums=()

prepare() {
  json=$(curl -s 'https://c2.yonyoucloud.com/yonbip-ec-resource/resource/file/get?type=amd64' \
    -H 'sec-ch-ua-platform: "Linux"' \
    -H 'Referer: https://ec.diwork.com/' \
    -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36' \
    -H 'Accept: application/json, text/plain, */*' \
    -H 'DNT: 1' \
    -H 'sec-ch-ua-mobile: ?0')

  url=$(echo "$json" | jq -r '.data')
  curl -L "$url" -o "${srcdir}/${pkgname}.deb"

  bsdtar -xf "${srcdir}/${pkgname}.deb" -C "$srcdir/"
}

package() {
  bsdtar -xf "$srcdir"/data.tar.* -C "$pkgdir/"
}