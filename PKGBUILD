# Maintainer: William Grieshaber <me@zee.li>
# Contributor: zertyz <zertyz@gmail.com>

pkgname=pingendo
pkgver=0.33.1
pkgrel=2
pkgdesc="An WYSIWYG HTML5 editor focused on Bootstrap UI"
arch=('i686' 'x86_64')
url="http://pingendo.com"
license=('custom:pingendo')
depends=('nss'
	'libnotify'
	'libxtst'
	'gtk2'
	'gcc-libs-multilib'
	'systemd'
	'alsa-lib'
	'gconf')
optdepends=('libnotify: Adds desktop notifications')
options=('!strip')
makedepends=('unzip')
source_i686=("http://pingendo.com/electron/${pkgname}-linux-i686.zip")
source_x86_64=("http://pingendo.com/electron/${pkgname}-linux-x86_64.zip")
source=("pingendo.desktop")
sha512sums=('f247bf6a2115ecef6e7bd10029657e6d72c5e1057cc9ea6f4a6081670e3de3ec02c574bbcc820edc88ef486f13b89ea22ed0d61479b65b07eda03af0947e39f1')
sha512sums_i686=('0bf0f2078b6282acf4696bcd49cc417023ef34bff1e11dde2acecb96cfba5579c345561de3eb481b476e720ed468a8f3d05b8e0d949355217a97f520c664aa08')
sha512sums_x86_64=('e3c3bf68beeb439b616f628d4eb8bba2ef19d4f8c44da9404114e621f4a4e98657b6e0008320557031287ab19c8e5b4ede00a9dfdd1d31005c8eb9ba33b99e19')

package() {
        mkdir -p "${pkgdir}/opt/"

        if [ "${CARCH}" == 'x86_64' ]; then
          cp -a "${srcdir}/Pingendo-linux-x64" "${pkgdir}/opt/${pkgname}"
          install -D -m0644 "${srcdir}/Pingendo-linux-x64/LICENSE" "${pkgdir}/usr/share/licenses/pingendo/LICENSE"
        elif [ "${CARCH}" == 'i686' ]; then
          cp -a "${srcdir}/Pingendo-linux-ia32" "${pkgdir}/opt/${pkgname}"
          install -D -m0644 "${srcdir}/Pingendo-linux-ia32/LICENSE" "${pkgdir}/usr/share/licenses/pingendo/LICENSE"
        fi

        chmod 755 "${pkgdir}/opt/${pkgname}/Pingendo"
        install -D -m0644 "${srcdir}/pingendo.desktop" "${pkgdir}/usr/share/applications/pingendo.desktop"
}
