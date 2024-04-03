# Maintainer: taotieren <admin@taotieren.com>

pkgname=genshin-nativefier
pkgver=0.0.1
pkgrel=1
pkgdesc="genshin collaborative edition built with nativefier"
arch=('x86_64')
url="https://ys.mihoyo.com/cloud/"
license=('custom')
depends=('gtk3' 'libxss' 'nss')
makedepends=('imagemagick' 'nodejs-nativefier' 'unzip')
source=('genshin-nativefier.desktop')
sha256sums=('6c8c8e2ddc76db4d326e1b179dfd7c39389fcfe0fba70b5957847a652cf1bdf8')

build() {
  nativefier \
    --name "genshin" \
    --disable-dev-tools \
    --verbose \
    --single-instance \
    --tray \
    "$url" \
    "genshin"
}

package() {
  cd $srcdir
  cd genshin
  cd */
  install -dm755 "${pkgdir}/"{opt,usr/{bin,share/{applications,licenses/${pkgname}}}}
  find . -type f -exec install -Dm755 "{}" "$pkgdir/opt/$pkgname/{}" \;
  cd $srcdir
  install -Dm644 "${pkgdir}/opt/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/"
  ln -s "/opt/$pkgname/genshin" "$pkgdir/usr/bin/$pkgname"
}
