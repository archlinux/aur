# Maintainer: Tulpenkiste <tulpenkiste at the amogus email domain which is .cloud>
# Maintainer: Aryan Ghasemi <aryangh1379@gmail.com>
_pkgname=supertux-advance
pkgname=supertux-advance-bin
pkgver=0.2.0
pkgrel=6
pkgdesc="A SuperTux game made in Brux GDK with 16bit-style graphics."

arch=('x86_64')

url="https://github.com/KelvinShadewing/supertux-advance"
license=('AGPL-3.0-only')

conflicts=("supertux-advance")

source=("${_pkgname}-${pkgver}.zip::$url/releases/download/v${pkgver}/sta-${pkgver}.zip" "$_pkgname.desktop" "$_pkgname")
sha256sums=('781cf8012fa4b79bdbd135b9d6b9244a287dcbcabcef2e6c451e8f00520aba72'
            '136dcfbec5e799d40550135ef505c3577d461648bf3edc78f8b79e3a8f827741'
            '0758aa43f5cf5e4428466f42bfa5a73e18e05f4a8581e95eb6f8e423cf421cd7')
noextract=("${_pkgname}-${pkgver}.zip")

package() {
    mkdir -p "${pkgdir}/opt/${_pkgname}/"
    unzip -d "${pkgdir}/opt/${_pkgname}/" "${_pkgname}-${pkgver}.zip"

    #removing MS Windows executables/libraries
    find "$pkgdir" -exec file -S \{\} \; | grep -i windows | cut -d: -f1 | xargs -I{} rm -v "{}"
    # Remove on next release
    rm -rv "$pkgdir/opt/$_pkgname/contrib/azzy"

	# Executable and Desktop file
    install -d "$pkgdir/usr/bin/"
    install -d "${pkgdir}/usr/share/icons/hicolor/16x16/apps"

    install -Dm755 "${srcdir}/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 "${srcdir}/$_pkgname.desktop" "$pkgdir/usr/share/applications/${_pkgname}.desktop"
	mv -v "${pkgdir}/opt/${_pkgname}/icon.png" "$pkgdir/usr/share/icons/hicolor/16x16/apps/$_pkgname.png"


}
