# Maintainer: noraj <printf %s 'YWxleGFuZHJlLnphbm5pQGV1cm9wZS5jb20='|base64 -d>
# ex-Contributor: Kenneth Endfinger <kaendfinger@gmail.com>
# ex-Contributor: MattWoelk
# ex-Contributor: xsmile

pkgname=nessus
pkgver=10.10.0
_did_x86_64=26745 # download id x86_64
_did_aarch64=26746 # download id aarch64
_distro=el9 # RHEL 9
pkgrel=1
pkgdesc="Nessus vulnerability scanner"
arch=('x86_64' 'aarch64')
depends=('gnupg')
makedepends=('inetutils')
license=('custom')
url="https://www.tenable.com/downloads/nessus"
install=${pkgname}.install
source=(nessus.desktop
        nessus.sh
        LICENSE)
source_x86_64=("nessus-${pkgver}-$_distro.x86_64.rpm::https://www.tenable.com/downloads/api/v1/public/pages/nessus/downloads/$_did_x86_64/download?i_agree_to_tenable_license_agreement=true")
source_aarch64=("nessus-${pkgver}-$_distro.aarch64.rpm::https://www.tenable.com/downloads/api/v1/public/pages/nessus/downloads/$_did_aarch64/download?i_agree_to_tenable_license_agreement=true")
b2sums=('e9f6346d0c2b444c71f0673a9dd22f4298abf1ccc4500fa2db4439627844106e3d523cda976411aa243f56711b691a12ac228809cdae038371607db11a44dd61'
        'fbc6b44c6722e48b26011314d3cd2a44780ef94965db159ef1a35743e371927ec4927a9da2db9ebbb9714fc3a0a30fa4d785b23aa76e4a8a1e446a515fc1bcdd'
        '2c68d4f30686a711fbf5c77b70d9b307f9fdcc8095cea79d8c310edfeea87563d94b9106fce35fc53685e6703afb729b9d81f504a1983c367621605690ea03e1')
b2sums_x86_64=('75085b94001ee4dc3a8d443305367e8cf0610ad6bbe1648a0978ea5d53dbec27ae61c5967349f1989a108d3809bfc497ea3a978a20f6dc93a38573d1d6ab3702')
b2sums_aarch64=('4dffee8a7a1c2a8c7bb7676bf5696706280dc40b1e1ea946e3b6f99d2ade04773d71120a35741be3db847a40f9a3931f10a7f8e55378888f98cac5bd01220002')
validpgpkeys=('9E53A34068D18A6E0EE45E41A021B5142F12969D')

package() {
  install -Dm755 "$pkgname.sh" "$pkgdir/etc/profile.d/$pkgname.sh"

  mkdir -p "$pkgdir/etc/ld.so.conf.d" "$pkgdir/usr/share" "$pkgdir/opt/${pkgname}" \
    "$pkgdir/usr/lib"

  cp -a usr/lib "$pkgdir/usr"

  # path to libraries
  echo "/opt/${pkgname}/lib" > "$pkgdir/etc/ld.so.conf.d/${pkgname}.conf"

  # main files
  cp -a "opt/${pkgname}/"{bin,com,etc,lib,sbin,var} "$pkgdir/opt/${pkgname}"

  # license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"

  # menu entry
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

