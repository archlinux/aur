#Maintainer: Janek Thomaschewski <janek@jbbr.net>

pkgname=rambox-bin
_pkgname=rambox
pkgver=0.4.0
pkgrel=1
pkgdesc='Free and Open Source messaging and emailing app that combines common web applications into one.'
arch=('i686' 'x86_64')
depends=('alsa-lib' 'bash' 'desktop-file-utils' 'gconf' 'gtk2' 'libnotify' 'libxtst' 'nss')
makedepends=('unzip')
provides=("rambox")
url='http://rambox.pro/'
license=('MIT')
source=("${_pkgname}.sh" "${_pkgname}.desktop" "${_pkgname}.png")
source_i686=("https://github.com/saenzramiro/rambox/releases/download/$pkgver/Rambox-linux-ia32.zip")
source_x86_64=("https://github.com/saenzramiro/rambox/releases/download/$pkgver/Rambox-linux-x64.zip")

sha256sums=('80d75e70dc6c843c3dd3f7c4ff92d89e452814234148315348a755c330f2e902'
            '61ad70a929c402e24c79b8868208310f9b3c4d7801db2b791af38293231ee524'
            '0bf4d0c849ad6151f77b346fea0424fab910f434378f9890b16fd15a32a10064')
sha256sums_i686=('8171796f897502bf827874e6dc95cf5121d70dd33ee2183a1d71682484512bcf')
sha256sums_x86_64=('22c3c0721ebfcf2f49e73e515965f21a352c66222807a0e79b1e0f63ba19ad0c')

[[ "$CARCH" = "i686" ]] && _path="Rambox-linux-ia32"
[[ "$CARCH" = "x86_64" ]] && _path="Rambox-linux-x64"
noextract=(${_path})

prepare() {
    install -d ${srcdir}/${_path}/
    unzip -q "${srcdir}/${_path}.zip" -d "${srcdir}/${_path}"
    chmod 755 ${srcdir}/${_path}/Rambox
}

package() {
    install -d ${pkgdir}/{opt/rambox,usr/{bin,share/pixmaps}}
    cp -R ${srcdir}/${_path}/* ${pkgdir}/opt/${_pkgname}/
    install -Dm755 $srcdir/${_pkgname}.sh ${pkgdir}/usr/bin/${_pkgname}
    install -Dm644 $srcdir/${_pkgname}.png ${pkgdir}/usr/share/pixmaps/${_pkgname}.png
    desktop-file-install ${srcdir}/${_pkgname}.desktop --dir ${pkgdir}/usr/share/applications/
}
