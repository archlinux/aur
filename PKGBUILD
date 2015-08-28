# Maintainer: Forest Crossman <cyrozap at gmail dot com>

pkgname=greenpak-designer-dev
pkgver=5.01
pkgrel=5
pkgdesc="GreenPAK1-4 Designer"
arch=('i686' 'x86_64')
url="http://www.silego.com/softdoc/software.html"
license=('custom')
depends=('desktop-file-utils' 'glu' 'gtk-update-icon-cache' 'libusb' 'qtwebkit' 'shared-mime-info')
options=('!strip')
install=${pkgname}.install

source=("http://www.silego.com/uploads/resources/GP1-4_Designer_v${pkgver}.00${pkgrel}_LNX_Setup.zip")
sha256sums=('41668325ce26c3b6d593553bece4a67296d15e561d6329f11ccc975e73a16bef')

if [[ $CARCH == 'i686' ]]; then
  _arch='i386'
elif [[ $CARCH == 'x86_64' ]]; then
  _arch='amd64'
fi

package() {
  # Extract the proper package
  ar p greenpak-designer-dev_${pkgver}-${pkgrel}_${_arch}.deb data.tar.gz | \
    tar -xz --exclude="usr/share/doc-base" --exclude="usr/share/lintian" -C "${pkgdir}"/

  # Shuffle some files
  mv "${pkgdir}"/lib/* "${pkgdir}"/usr/lib/
  rm -r "${pkgdir}"/lib

  # Install license file
  install -dm 755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/copyright"
  ln -s "/usr/share/doc/${pkgname}/licence.rtf.gz" "${pkgdir}/usr/share/licenses/${pkgname}/license.rtf.gz"
}
