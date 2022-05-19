# Maintainer: Musee "lae" Ullah <lae(at)lae(dot)is>

pkgname=ytsubconverter-bin
_reponame=YTSubConverter
pkgver=1.6.3
pkgrel=2
pkgdesc="A tool for creating styled YouTube subtitles"
arch=('x86_64')
url="https://github.com/arcusmaximus/YTSubConverter"
license=('MIT')
provides=('ytsubconverter')
depends=('mono')
source=("ytsubconverter.desktop"
        "ytsubconverter.sh"
        "ytsc-bin-${pkgver}.tar.xz::https://github.com/arcusmaximus/${_reponame}/releases/download/${pkgver}/${_reponame}-Linux.tar.xz")
sha256sums=('8d28386263f039bf3e7db1ff7db97039a23aa8f1eb345c769a8e8da388fccb5a'
            'e42a5a178c01515e9db901038562c7e220d3088cfb49abaf8d0a3c80e5e36637'
            '788323174e7234a1c346fbcc921281b26c341454de6be97c2ada89ae90f4c557')

package() {
    install -Dm644 "${srcdir}/ytsubconverter.desktop" "${pkgdir}/usr/share/applications/ytsubconverter.desktop"

    install -d "${pkgdir}/opt/${_reponame}"
    for dll in AtkSharp CairoSharp GdkSharp GioSharp GLibSharp GtkSharp \
               PangoSharp YTSubConverter.Shared
    do
        install -Dm644 "${srcdir}/${dll}.dll" "${pkgdir}/opt/${_reponame}/${dll}.dll"
    done
    for lang in ja ko ms pl ru zh-Hans zh-Hant
    do
        install -Dm644 "${srcdir}/${lang}/YTSubConverter.Shared.resources.dll" \
                       "${pkgdir}/opt/${_reponame}/${lang}/YTSubConverter.Shared.resources.dll"
    done
    install -Dm644 "${srcdir}/checkers.png" "${pkgdir}/opt/${_reponame}/checkers.png"
    install -Dm644 "${srcdir}/StyleOptions.xml" "${pkgdir}/opt/${_reponame}/StyleOptions.xml"

    # Actual executables.
    install -Dm644 "${srcdir}/YTSubConverter.exe" "${pkgdir}/opt/${_reponame}/YTSubConverter.exe"
    install -d "${pkgdir}/usr/bin"
    install -Dm 755 "${srcdir}/ytsubconverter.sh" "${pkgdir}/usr/bin/ytsubconverter"
}
