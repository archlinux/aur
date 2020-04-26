# Maintainer: Michał Lisowski <lisu@riseup.net>
pkgname=opensubtitles-uploader
pkgver=2.5.0
pkgrel=1
pkgdesc="Desktop app to upload subtitles to OpenSubtitles, using Node.JS and NWjs"
arch=('i686' 'x86_64')
url="https://github.com/vankasteelj/opensubtitles-uploader"
license=('GPL3')
makedepends=('npm' 'git' 'gulp')
source=("${pkgname}::https://github.com/vankasteelj/${pkgname}/archive/${pkgver}.tar.gz"
        "${pkgname}.desktop"
        "${pkgname}.png")
md5sums=('f12740d363c6282bbd2ab0e3f20100ba'
         'f38a85d864e5aca6706a76adec1c5e86'
         'f8e90af7251e2c76a9d863e283aa3804')

prepare() {
  cd "$pkgname-$pkgver"
}

build() {
  cd "$pkgname-$pkgver"
  npm install
  gulp build
}

package() {
  cd "$pkgname-$pkgver"
  install -m 0755 -d ${pkgdir}/opt/${pkgname}
  install -m 0755 -d ${pkgdir}/usr/share/applications
  install -m 0755 -d ${pkgdir}/usr/share/icons
  install -m 0644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications
  install -m 0644 ${srcdir}/${pkgname}.png ${pkgdir}/usr/share/icons
  cp -R build/${pkgname}/linux*/* ${pkgdir}/opt/${pkgname}
}
