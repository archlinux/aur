# Maintainer: gigas002 <gigas002@pm.me>

pkgname=poi-nightly-bin
_pkgname=poi
_releasever=10.8.0
_buildver=7916
pkgver=$_releasever.$_buildver
pkgrel=2
pkgdesc="Scalable KanColle browser and tool"
arch=('x86_64')
url="https://github.com/poooi/poi/"
license=('MIT')
provides=("poi")
depends=('nss' 'gtk3')
conflicts=('poi')
options=(!strip)
source=("https://nightly.poi.moe/$_buildver/$_pkgname-$_releasever.7z"
        "https://raw.githubusercontent.com/poooi/poi/master/assets/icons/icon.png"
        "$_pkgname.desktop"
	    "$_pkgname.sh")
noextract=("$_pkgname-$_releasever.7z")
sha256sums=(
    '12b7920f6c446df78eebf8c96ec1902927debe4835e8359922c8581076556c27'
    '7f58b9f7918da59bf8003f9d2345eb0f0700b7cfcb3c07ef17a171e3f08fe3f8'
    '56280a62f7baf889253830353748f6ddd8d3c5924c5faaaffa863ada2d7e2e58'
    'b08d1eb63de3af0c67860fd8bfd709d492ac600eef9c0cd52e2ee65e5ab69194')

package() {
    mkdir -p "${pkgdir}/opt/${_pkgname}/"
	bsdtar -xf "$_pkgname-$_releasever.7z" -C "${pkgdir}/opt/${_pkgname}/"
    chmod 4755 "${pkgdir}/opt/${_pkgname}/chrome-sandbox"
    install -Dm755 "$_pkgname.sh" "${pkgdir}/usr/bin/$_pkgname"

    # Install pixmap and desktop files
    install -Dm644 icon.png "$pkgdir/usr/share/pixmaps/poi_icon.png"
    install -Dm644 -t "$pkgdir/usr/share/applications" poi.desktop
}
