# Maintainer: Jerry Xiao <aur@mail.jerryxiao.cc>

_id=ocaahdebbfolfmndjeplogmgcagdmblk
pkgname=chromium-extension-web-store
pkgver=1.4.4.2
pkgrel=1
pkgdesc="chromium web store extension (for ungoogled-chromium)"
arch=('any')
url="https://github.com/NeverDecaf/chromium-web-store"
license=('MIT')
source=("${pkgname}-${pkgver}.crx::${url}/releases/download/v${pkgver}/Chromium.Web.Store.crx")
noextract=("${pkgname}-${pkgver}.crx")
sha256sums=('0714acb21e42b5a0247b3ed88024d23225a534d76cb918b9558b739fbc35f1bb')
install=chromium-extension-web-store.install

prepare() {
    # Create extension json
    cat << EOF > "${_id}".json
{
    "external_crx": "/usr/lib/${pkgname}/${pkgname}-${pkgver}.crx",
    "external_version": "${pkgver}"
}
EOF
}

package() {
    install -Dm644 -t "${pkgdir}/usr/share/chromium/extensions/" "${_id}.json"
    install -Dm644 -t "${pkgdir}/usr/lib/${pkgname}/" "${pkgname}-${pkgver}.crx"
}
