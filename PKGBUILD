# Maintainer: Aria Vesta <dev@ariavesta.com>
# Contributor: Jonathan "nekonyuu" Raffre <nk@nyuu.eu>
pkgname=inkdrop
_pkgname=inkdrop
_appid=app.inkdrop.Inkdrop
pkgver=6.1.5
pkgrel=1
pkgdesc="The Note-taking App with Robust Markdown Editor"
arch=('x86_64' 'aarch64')
url="https://www.inkdrop.app/"
license=('custom')
depends=('gnome-keyring' 'gtk3' 'libsecret' 'libxss' 'nss')
optdepends=('python' 'nodejs')
options=(!debug !strip)

source_x86_64=(${_pkgname}-${pkgver}-x86_64.zip::https://dist.inkdrop.app/releases/inkdrop-${pkgver}-x64-linux.zip)
source_aarch64=(${_pkgname}-${pkgver}-aarch64.zip::https://dist.inkdrop.app/releases/inkdrop-${pkgver}-arm64-linux.zip)
sha512sums_x86_64=('32cf931ddc7cdcec3b6a20a081fcedf19f83aaa332cc857e8aafb15da641d1a459d7932800b779f1c59b70afca9dfdb4824996a94dbacd925463d8aa8bbace12')
sha512sums_aarch64=('c1059b24c8b7106703b74080736b99a427556fdf98ffb8c4baaf4e51e602c8b46b048bdac0122ccad88f1b6a29ea22a395e7133deb8a8dfad8220f2c679df4b4')

package() {
    install -Dm644 ${srcdir}/${_appid}.desktop ${pkgdir}/usr/share/applications/${_appid}.desktop
    install -Dm644 ${srcdir}/${_appid}.metainfo.xml ${pkgdir}/usr/share/metainfo/${_appid}.metainfo.xml
    install -Dm644 ${srcdir}/${_appid}.png ${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_appid}.png

    rm ${srcdir}/${_pkgname}-${pkgver}-${CARCH}.zip ${srcdir}/${_appid}.*

    mkdir -p ${pkgdir}/usr/lib/inkdrop ${pkgdir}/usr/bin
    cp -ar ${srcdir}/* ${pkgdir}/usr/lib/inkdrop
    ln -sf /usr/lib/inkdrop/inkdrop ${pkgdir}/usr/bin/inkdrop
}
