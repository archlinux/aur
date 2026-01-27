# Maintainer: lae <lae(at)lae(dot)is>

pkgname=ytsubconverter-bin
_reponame=YTSubConverter
pkgver=1.6.5
pkgrel=2
pkgdesc="A tool for creating styled YouTube subtitles"
arch=('x86_64')
url="https://github.com/arcusmaximus/YTSubConverter"
license=('MIT')
provides=('ytsubconverter')
depends=('dotnet-runtime-8.0')
optdepends=('mitmproxy: for testing captions locally')
source=("ytsubconverter.sh"
        "ytsc-bin-${pkgver}.tar.xz::https://github.com/arcusmaximus/${_reponame}/releases/download/${pkgver}/${_reponame}-Linux.deb")
sha256sums=('160137edcc4ef916c97ef3e62564e31844e2b5114ffc64eb3cc32005fa0086e0'
            'f684737e9aa633f8860f3b0c4e71d99a6c74de77f6e1fb02ca1fe38c596fff11')

package() {
    tar -xf data.tar.zst -C "${pkgdir}" --no-same-owner
    # release artifacts have unnecessary executable permissions on PNGs and DLLs
    find "${pkgdir}" -type f -not -iname ytsubconverter -exec chmod 644 {} \;
    # and some folders have group write permission...
    find "${pkgdir}" -type d -exec chmod 755 {} \;

    install -d "${pkgdir}/usr/bin"
    install -Dm 755 "${srcdir}/ytsubconverter.sh" "${pkgdir}/usr/bin/ytsubconverter"
}
