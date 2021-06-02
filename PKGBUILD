# Maintainer: Malacology <guoyizhang at malacology dot com>
# Contributor: Malacology <guoyizhang at malacology dot com>

pkgname=fluentreader
pkgver=1.0.1
pkgrel=1
pkgdesc="Modern desktop RSS reader built with Electron, React, and Fluent UI"
arch=('any')
url="https://github.com/yang991178/fluent-reader/"
license=('BSD-3-Clause License')
source=("https://github.com/yang991178/fluent-reader/releases/download/v${pkgver}/Fluent.Reader.${pkgver}.AppImage" "fluentreader.desktop")
sha256sums=('36c650b05776a33fc043bfbf0a9133cab74f8a936b0666cae2c5d386eca7bfa9'
            '5704317ddd09e429b4ddb793ddf4f3da2a38ff6d5a4d30c42db726a9bdc8618a')
prepare() {
  cd "${srcdir}"
  chmod +x Fluent.Reader.${pkgver}.AppImage
  ./Fluent.Reader.${pkgver}.AppImage --appimage-extract
}

package() {
  install -dDm755 "$pkgdir"/usr/{bin,share/{applications,fluentreader}}
  cd "$srcdir"/squashfs-root
  mv * "$pkgdir"/usr/share/fluentreader
  ln -s /usr/share/fluentreader/fluent-reader "$pkgddir"/usr/bin/fluent-reader
  install -m 755 ${srcdir}/*.desktop ${pkgdir}/usr/share/applications
}
