# Maintainer: Musee "lae" Ullah <lae(at)lae(dot)is>

pkgname=ytsubconverter-bin
_reponame=YTSubConverter
pkgver=1.5.4
pkgrel=1
pkgdesc="A tool for creating styled YouTube subtitles"
arch=('x86_64')
url="https://github.com/arcusmaximus/YTSubConverter"
license=('MIT')
provides=('ytsubconverter')
depends=('mono')
source=("ytsubconverter.desktop"
        "https://github.com/arcusmaximus/${_reponame}/releases/download/${pkgver}/${_reponame}-Linux.tar.xz")
sha256sums=('8d28386263f039bf3e7db1ff7db97039a23aa8f1eb345c769a8e8da388fccb5a'
            '80c8ef0c24abe3bbfc40060b2c87b0d4bc3529d909cb3adf63c8f242cc327b29')

package() {
    install -Dm644 "${srcdir}/ytsubconverter.desktop" "${pkgdir}/usr/share/applications/ytsubconverter.desktop"

    install -d "${pkgdir}/opt/${_reponame}"
    for dll in AtkSharp CairoSharp GdkSharp GioSharp GLibSharp GtkSharp \
               PangoSharp YTSubConverter.Shared
    do
        install -Dm644 "${srcdir}/${_reponame}/${dll}.dll" "${pkgdir}/opt/${_reponame}/${dll}.dll"
    done
    for lang in ja ko ms pl ru zh-Hans zh-Hant
    do
        install -Dm644 "${srcdir}/${_reponame}/${lang}/YTSubConverter.Shared.resources.dll" \
                       "${pkgdir}/opt/${_reponame}/${lang}/YTSubConverter.Shared.resources.dll"
    done
    for f in checkers.png StyleOptions.xml YTSubConverter.exe
    do
        install -Dm644 "${srcdir}/${_reponame}/${f}" "${pkgdir}/opt/${_reponame}/${f}"
    done
}
