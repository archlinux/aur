# Maintainer: Drew S. Ortega <orvyx@protonmail.com>
pkgname=brim
pkgver=0.29.0
pkgrel=3
pkgdesc="Desktop application to efficiently search and analyze super-structured data. Powered by Zed."
arch=('x86_64')
url="https://www.brimsecurity.com/download/"
license=('custom')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'glib2')
optdepends=('lsb-release' 'libgnome-keyring' 'pulseaudio')
source=("https://github.com/brimdata/brim/releases/download/v${pkgver}/${pkgname}-${pkgver}.deb"
"https://raw.githubusercontent.com/brimdata/brim/v${pkgver}/LICENSE.txt"
)
noextract=("${pkgname}-${pkgver}.deb")
sha256sums=('70f8cd660cf3f52c95af634edd957435f88ed22fe3c47af9bf87c09139f3e423'
            'a8b360eb5a0cf91c98f39fd4259d09263d883222a8be42b0ee77ad80937e86ac')

package() {
        # extract to pkgdir
        bsdtar -O -xf "${pkgname}-${pkgver}.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

        # remove debian-specific files
        rm -rf "${pkgdir}/usr/share/lintian"

        # install LICENSE.txt
        install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
        install "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}"

	# add binary to path
	mkdir "${pkgdir}/usr/bin"
	ln -s "${pkgdir}/opt/Brim/brim" "${pkgdir}/usr/bin/brim"
}
