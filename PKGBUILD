# Maintainer: katt <magunasu.b97@gmail.com>

pkgname=steamclip
pkgver=4.5
pkgrel=2
pkgdesc='A simple PYTHON script to convert Steam recordings to .mp4 files'
arch=(any)
url=https://github.com/Nastas95/SteamClip
license=(GPL-3.0-only)
depends=(
	python
	python-imageio-ffmpeg
	python-pathvalidate
	python-pillow
	python-pyqt6
	python-requests
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        https://github.com/Nastas95/SteamClip/commit/df56098d262ad94c8526b30d0175c61396a21c01.patch)
sha256sums=('2758be726eb23859e7a610ce22c427ab93f645f8d212890473d834806130d16a'
            'cef49c8f37e65f1b76c4058338fafd8ee8240db2720d4961f6f4ac65f856cf21')

prepare() {
    patch -d "SteamClip-${pkgver}" -Np1 -i ../df56098d262ad94c8526b30d0175c61396a21c01.patch
}

package() {
    install -Dm755 "SteamClip-${pkgver}/${pkgname}.py" "${pkgdir}/usr/bin/${pkgname}"

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname}.desktop" << END
[Desktop Entry]
Name=SteamClip
Comment=A simple PYTHON script to convert Steam recordings to .mp4 files
Exec=${pkgname}
Terminal=false
Categories=Utility;
Type=Application
Icon=applications-games
END
}
