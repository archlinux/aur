# Maintainer: Sokoloft <sokoloft nospamat protonmail nospamdot com>
# Contributor: Adrian Groh <adrian[dot]groh[at]t[dash]online[dot]de>
# Contributor: Oliver Rümpelein <arch@pheerai.de>; Siegfried Krug <siegfried nospamat fg4f nospamdot de>
# Contributor: Evan Anderson <evananderson@thelinuxman.us>

pkgname=x32edit-bin
_pkgname="${pkgname%-bin}" # Removes trailing "-bin"
pkgver=4.4.1
pkgrel=1
pkgdesc="Remote control program for Behringer X32 mixers"
arch=('x86_64')
url="https://www.behringer.com"
license=('custom')
makedepends=("gendesk")
depends=("alsa-lib" "freetype2" "curl" "gcc-libs" "glibc")

source=("EULA_2012-09-12.pdf"
        "X32-Edit_LINUX_$pkgver.tar.gz::https://cdn-media.empowertribe.com/23b991ede2e6473d916c7ac56f53d71d/X32-Edit_LINUX_$pkgver.tar.gz"
        "${_pkgname}.png")

sha512sums=('fe39285768937d82f31844b789d1075de8196495727653595e59f4f1b282f6dbe18a8a8bc51b837f284601dc37c52211d3d494a8636512f5398da31ff3d30284'
            '7d5ed5ea0400a63179adb59e701472b78efecd50a5d8c9ffb4ad5df4e9116cf9af35fcd2b856c1d7e899ce923b9fa1822272363969500a180477e5addac8b96f'
            'b08b60036dc8794d14f5f7e2792c09e89796aa3c4118ebd3e007cbdf5e2e8e09196a0ed434d21a2b5cddbfe7525d37898eb5bf73d179dedf39aace821cbdefdb')
b2sums=('f3af5fcb0044782d51ef976375b6184d781bab5110fb2184ac40443df7b21fdfc12ffa534448bb0aa41df8210c5e63a7d2995ee54279c2ec0824de5eb83aae64'
        '16a012f7071d72992c5425a393bf43f855907eb8201a57db348002a88988b8886273b9b5768fd92327ace64da3cccc44397cdce482e6eebc62d9ee4be917c20a'
        '75f59c457f27432cea3fffe255b9c1222eaf55b8f276306b9272096c01b12a347deb0d1a4ec7acecd9f3405915fffce5f45c64e695a088d48d24d211e2aeede9')


prepare() {
	gendesk -n --pkgname "${_pkgname}" --pkgdesc "${pkgdesc}" --exec="${_pkgname}" --name "X32 Edit" --icon "${_pkgname}.png" --categories "AudioVideo;Audio" --terminal=false --custom="Keywords=Mixer;Behringer;"
}

package() {
    install -Dm755 "X32-Edit" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "EULA_2012-09-12.pdf" "${pkgdir}/usr/share/licenses/${_pkgname}/license.pdf"
    install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
}
