# Maintainer: noraj <printf %s 'YWxleGFuZHJlLnphbm5pQGV1cm9wZS5jb20='|base64 -d>
# Contributor: Kenneth Endfinger <kaendfinger@gmail.com>
# Contributor: MattWoelk
# Contributor: xsmile <sascha_r gmx de>

pkgname=nessus
pkgver=8.10.0
pkgrel=1
pkgdesc="Nessus vulnerability scanner"
arch=('x86_64')
depends=('gnupg')
license=('custom')
url="https://www.tenable.com/downloads/nessus"
install=${pkgname}.install

source=("nessus-${pkgver}-fc20.x86_64.rpm::https://www.tenable.com/downloads/api/v1/public/pages/nessus/downloads/10846/download?i_agree_to_tenable_license_agreement=true"
        nessus.desktop
        nessus.sh
        LICENSE)

sha256sums=('295cf508812c3aff21daad24085c89e8c1647be89baf9dd7f3314c2eb59f127f'
            '8c5e82d609a7290c34cbfa5635012cb66820e4e2c1db2bf5808fc306fcefdc30'
            '9b8e2c15d86ce7b83806a27bd6685f009ad339f3ea52022b87a75fbd2802ec5a'
            'd647aedd39d571faa3f1a9906db561eecbd9c41605ba7f562261ffb04877ba26')

package() {
  install -Dm755 $pkgname.sh "$pkgdir/etc/profile.d/$pkgname.sh"

  mkdir -p "$pkgdir/etc/ld.so.conf.d" "$pkgdir/usr/share" "$pkgdir/opt/nessus" \
           "$pkgdir/usr/lib"

  cp -a usr/lib "$pkgdir/usr"

  # path to libraries
  echo /opt/nessus/lib > "$pkgdir/etc/ld.so.conf.d/nessus.conf"

  # main files
  cp -a opt/nessus/{bin,com,etc,lib,sbin,var} "$pkgdir/opt/nessus"

  # license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/nessus/LICENSE"

  # menu entry
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
