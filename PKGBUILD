# Maintainer: NekoLOvO <nekolying@gmail.com>

pkgname=persepolis-bin
pkgver=5.2.0
pkgrel=1
pkgdesc="Persepolis is a download manager written in Python. Persepolis is a sample of free and open source software."
arch=('any')
url="https://github.com/persepolisdm/persepolis"
license=('GPLv3')
depends=(
    'python-urllib3'
    'python-pysocks'
    'python-requests'
    'python-setproctitle'
    'python-psutil'
    'yt-dlp'
    'ffmpeg'
    'python-dasbus'
    'breeze'
    'pyside6'
)
conflicts=('persepolis')
provides=('persepolis')
source=("${url}/releases/download/${pkgver}/persepolis_${pkgver}.2_all.deb")
sha256sums=('2cdbdd8e9f6669958d1ad03aaf1b29bd0e883f09ac0efe3701fed57b41f8160b')

package() {
    bsdtar -xf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
    local pyver=$(python -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')
    mkdir -p "${pkgdir}/usr/lib/python${pyver}"
    mv -f "${pkgdir}/usr/lib/python3/dist-packages" "${pkgdir}/usr/lib/python${pyver}/site-packages"
    rm -rf "${pkgdir}/usr/lib/python3"
}
