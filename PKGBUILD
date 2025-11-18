# Maintainer: lae <lae(at)lae(dot)is>

pkgname=ytsubconverter-bin
_reponame=YTSubConverter
pkgver=1.6.4
pkgrel=1
pkgdesc="A tool for creating styled YouTube subtitles"
arch=('x86_64')
url="https://github.com/arcusmaximus/YTSubConverter"
license=('MIT')
provides=('ytsubconverter')
depends=('dotnet-runtime-8.0')
optdepends=('mitmproxy: for testing captions locally')
source=("ytsubconverter.sh"
        "ytsc-bin-${pkgver}.tar.xz::https://github.com/arcusmaximus/${_reponame}/releases/download/${pkgver}/${_reponame}-Linux.deb")
sha256sums=('6f7c73b4aed185a6e19d0876fb398ac097a1aa0f2269911aea2da6cd1b5028f1'
            'df824bb53f17986c9fe0a9a42af6db7ec6c79c34e69619b5f0b734bebfcd6947')

package() {
    tar -xf data.tar.zst -C "${pkgdir}" --no-same-owner
    # release artifacts have unnecessary executable permissions on PNGs and DLLs
    find "${pkgdir}" -type f -not -iname ytsubconverter -exec chmod 644 {} \;
    # and some folders have group write permission...
    find "${pkgdir}" -type d -exec chmod 755 {} \;

    install -d "${pkgdir}/usr/bin"
    install -Dm 755 "${srcdir}/ytsubconverter.sh" "${pkgdir}/usr/bin/ytsubconverter"
}
