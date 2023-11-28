# Maintainer: Donald Webster <fryfrog@gmail.com>
# Contributor: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname=bazarr
pkgver=1.4.0
pkgrel=1
pkgdesc="Subtitle management and download automation for Sonarr and Radarr."
arch=('any')
url="https://github.com/morpheus65535/bazarr"
license=('GPL3')
options=('!strip' 'staticlibs')
makedepends=(
  'unzip'
  'python-setuptools'
)
depends=(
  'sqlite'
  'python'
  'python-gevent'
  'python-gevent-websocket'
  'python-lxml'
  'python-numpy'
  'python-pillow'
  'python-webrtcvad'
  'ffmpeg'
  'unrar'
)
source=(
  "bazarr-${pkgver}.zip::https://github.com/morpheus65535/bazarr/releases/download/v${pkgver}/bazarr.zip"
  'bazarr.service'
  'bazarr.sysusers'
  'bazarr.install'
  'bazarr.tmpfiles'
)
noextract=("bazarr-${pkgver}.zip")

sha256sums=('b023f5239ec54974dfe624259942101ccad218d3b11bf47669a854dc3f31e56c'
            '26518fb173e38c73c59c9ca8024cef546f8d0041044a49de414146bf2e15f631'
            '92fd48cbd7e5fe3a0388bbe756a52098fc461ef2dc87d9e886452e4f15acdcdc'
            '573beeac951d427e980332ce4d8645ae2299082e6c9c04f96e2a41a98c3acc60'
            'e7055260d0f3554e8b628d9560d8e12a40f720d76542048df0dfc838db88357b')

prepare() {
  unzip -qq -o -d bazarr-${pkgver} bazarr-${pkgver}.zip
}

package() {
  install -d -m 755 "${pkgdir}/usr/lib/bazarr"

  cp -dpr --no-preserve=ownership "${srcdir}/bazarr-${pkgver}/"* "${pkgdir}/usr/lib/bazarr"

  install -D -m 644 "${srcdir}/bazarr.service" "${pkgdir}/usr/lib/systemd/system/bazarr.service"
  install -D -m 644 "${srcdir}/bazarr.sysusers" "${pkgdir}/usr/lib/sysusers.d/bazarr.conf"
  install -D -m 644 "${srcdir}/bazarr.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/bazarr.conf"
}
