# Contributor: masmu
# Contributor: Cygn
# Maintainer: pika02 <pikakolendo02 ät gmail döt com>

pkgname=pulseaudio-dlna-cygn
pkgver=0.6.4
pkgrel=1
pkgdesc='Small DLNA server which brings DLNA/UPnP support to PulseAudio, Cygn edition'
arch=('x86_64')
url=https://github.com/Cygn/pulseaudio-dlna/
license=('GPL3')
provides=('pulseaudio-dlna')
depends=('python-chardet' 'python-dbus' 'python-docopt' 'python-gobject'
         'python-lxml' 'python-netifaces' 'python-notify2' 'python-psutil'
         'python-pychromecast' 'python-pyroute2' 'python-requests'
         'python-setproctitle' 'python-protobuf' 'python-setuptools'
         'python-zeroconf' 'python-urllib3' 'python-virtualenv')
makedepends=('git' 'help2man')
optdepends=('faac: AAC transcoding support'
            'ffmpeg: multiple formats support'
            'flac: FLAC transcoding support'
            'lame: MP3 transcoding support'
            'opus-tools: OPUS transcoding support'
            'sox: WAV transcoding support'
            'vorbis-tools: OGG transcoding support')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Cygn/pulseaudio-dlna/archive/${pkgver}.tar.gz")
sha256sums=('be4746df0a3073a4b1f9cca92bf006fc531942e3238a44f2a2bd7549c03c153d')


build() {
    mv "${srcdir}/pulseaudio-dlna-${pkgver}" "${srcdir}/${pkgname}-${pkgver}"
    cd "${pkgname}-${pkgver}"
    make PREFIX="/usr"
}

package() {
    cd "${pkgname}-${pkgver}"
    mkdir -p "${pkgdir}/opt/${pkgname}/bin"
#     mkdir -p "${pkgdir}/opt/${pkgname}/lib"
    mkdir -p "${pkgdir}/usr/bin"
    cp -a "${srcdir}/${pkgname}-${pkgver}/bin/pulseaudio-dlna" "${pkgdir}/opt/${pkgname}/bin/"
    cp -a "${srcdir}/${pkgname}-${pkgver}/bin/python" "${pkgdir}/opt/${pkgname}/bin/"
    cp -a "${srcdir}/${pkgname}-${pkgver}/lib" "${pkgdir}/opt/${pkgname}/"
    cp -a "${srcdir}/${pkgname}-${pkgver}/pyvenv.cfg" "${pkgdir}/opt/${pkgname}/"
    sed -i "1c\#!/opt/${pkgname}/bin/python" "${pkgdir}/opt/${pkgname}/bin/pulseaudio-dlna"
    ln -s "${pkgdir}/opt/${pkgname}/bin/pulseaudio-dlna" "${pkgdir}/usr/bin/pulseaudio-dlna"
}

