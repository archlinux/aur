# Maintainer: noraj <printf %s 'YWxleGFuZHJlLnphbm5pQGV1cm9wZS5jb20='|base64 -d>
# Contributor: Kenneth Endfinger <kaendfinger@gmail.com>
# Contributor: MattWoelk
# Contributor: xsmile <sascha_r gmx de>

pkgname=nessus
pkgver=8.2.2
pkgrel=1
pkgdesc="Nessus vulnerability scanner"
arch=('x86_64')
depends=('gnupg')
license=('custom')
url="https://www.tenable.com/products/nessus-home"
install=${pkgname}.install

# Note: I had to use a file hoster because Tenable doesn't provide a direct link.
source=("Nessus-${pkgver}-fc20.x86_64.rpm::https://od.lk/d/NTRfMTMzNTY3NjBf/Nessus-8.2.2-fc20.x86_64.rpm"
        nessus.desktop
        nessus.sh
        LICENSE)

sha256sums=('60a036a8cda835f644cc4be7c16c6b49e485fabdfd25ed6ab5e9a87825fbe835'
            '8c5e82d609a7290c34cbfa5635012cb66820e4e2c1db2bf5808fc306fcefdc30'
            '9b8e2c15d86ce7b83806a27bd6685f009ad339f3ea52022b87a75fbd2802ec5a'
            '089073d03bf83e101b50da858348ace6bb2a553ce2249532d6f5d7ed29182dac')

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
