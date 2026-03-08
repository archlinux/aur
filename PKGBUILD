# Maintainer: noraj <printf %s 'YWxleGFuZHJlLnphbm5pQGV1cm9wZS5jb20='|base64 -d>
# ex-Contributor: Kenneth Endfinger <kaendfinger@gmail.com>
# ex-Contributor: MattWoelk
# ex-Contributor: xsmile

pkgname=nessus
pkgver=10.11.3
_did_x86_64=28022 # download id x86_64
_did_aarch64=28023 # download id aarch64
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
b2sums_x86_64=('05944dba58662c911545f39b5eaed83f6645b3472e46b7341e5e95b285976742067587ce8d5def8b11f9f3b81f6e7c32ededed1d9c680d2e3e6c30fe6cb00562')
b2sums_aarch64=('e5e5f447440d6544039dd9f9de7f96c6307e6ce69422bc0ad74935c25932e5f2886d3e5e9c883bd6c5785b5c97e69c865885c06fdbadf8a4fa27171cc74fd95a')
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

