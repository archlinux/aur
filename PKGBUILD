# Maintainer: noraj <printf %s 'YWxleGFuZHJlLnphbm5pQGV1cm9wZS5jb20='|base64 -d>
# ex-Contributor: Kenneth Endfinger <kaendfinger@gmail.com>
# ex-Contributor: MattWoelk
# ex-Contributor: xsmile

pkgname=nessus
pkgver=10.6.4
pkgrel=1
pkgdesc="Nessus vulnerability scanner"
arch=('x86_64')
depends=('gnupg')
makedepends=('inetutils')
license=('custom')
url="https://www.tenable.com/downloads/nessus"
install=${pkgname}.install
source=("nessus-${pkgver}-fc34.x86_64.rpm::https://www.tenable.com/downloads/api/v1/public/pages/nessus/downloads/21571/download?i_agree_to_tenable_license_agreement=true"
        nessus.desktop
        nessus.sh
        LICENSE)
b2sums=('ad28fd8c0466c699fa650b0c2d547be103d2e9a1ba226572133c4cff6880b6fda1c2e4e940c20a1367ff4a7f437245538d453575ad8d0cf21fb0ba31f8d7d0e7'
        'e9f6346d0c2b444c71f0673a9dd22f4298abf1ccc4500fa2db4439627844106e3d523cda976411aa243f56711b691a12ac228809cdae038371607db11a44dd61'
        'fbc6b44c6722e48b26011314d3cd2a44780ef94965db159ef1a35743e371927ec4927a9da2db9ebbb9714fc3a0a30fa4d785b23aa76e4a8a1e446a515fc1bcdd'
        '2c68d4f30686a711fbf5c77b70d9b307f9fdcc8095cea79d8c310edfeea87563d94b9106fce35fc53685e6703afb729b9d81f504a1983c367621605690ea03e1')

package() {
  install -Dm755 $pkgname.sh "$pkgdir/etc/profile.d/$pkgname.sh"

  mkdir -p "$pkgdir/etc/ld.so.conf.d" "$pkgdir/usr/share" "$pkgdir/opt/${pkgname}" \
           "$pkgdir/usr/lib"

  cp -a usr/lib "$pkgdir/usr"

  # path to libraries
  echo /opt/${pkgname}/lib > "$pkgdir/etc/ld.so.conf.d/${pkgname}.conf"

  # main files
  cp -a opt/${pkgname}/{bin,com,etc,lib,sbin,var} "$pkgdir/opt/${pkgname}"

  # license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"

  # menu entry
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

