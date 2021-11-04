# Maintainer: agafron

pkgname=mediaget
#_pkgname=mediaget
pkgver=3.200.4007
pkgrel=4
pkgdesc="torrent player torrent-client"
arch=('i386' 'x86_64')
url="https://mediaget.com/"
license=('custom')
depends=('libidn11' 'gcc-libs' 'vlc') 
#conflicts=("zvvradio-git")
source=("${pkgname}.tar.xz::https://mediaget.com/ld/get_installer.php?os=linux&mgsite=1&r=ms_google" "mediaget.desktop" "mediaget")
md5sums=('5974fa98ea6b3dbae7bee4fffb50a7d5'
         'a0d5c36d4c355317fba5eed5ad55880c'
         '70f419b3a15bee508f8bd1beb3b85342')

  package() {
	cd "$srcdir"
          mkdir -p "$pkgdir"/opt
        cp -r mediaget_linux_4007 $pkgdir/opt/mediaget
       
	for res in 256 128 64 48 32 24 22 16; do
		convert "${pkgdir}/opt/${pkgname}/resources/${pkgname}.png" \
			-resize ${res}x${res} \
			"${pkgdir}/opt/${pkgname}/resources/${pkgname}_${res}.png"
	done
	for res in 16 22 24 32 48 64 128 256; do
		install -Dm644 "${pkgdir}/opt/${pkgname}/resources/${pkgname}_${res}.png" \
			"${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps/${pkgname}.png"
	done
       install -Dm755 mediaget.desktop "$pkgdir/usr/share/applications/mediaget.desktop"
       mkdir "$pkgdir"/usr/bin
       install -Dm755 mediaget "$pkgdir/usr/bin/mediaget"
}

