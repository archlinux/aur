# Maintainer: noraj <printf %s 'YWxleGFuZHJlLnphbm5pQGV1cm9wZS5jb20='|base64 -d>
# Contributor: neale

pkgname=nessus-agent
_pkgname=nessus_agent
pkgver=10.2.0
pkgrel=1
pkgdesc="Nessus vulnerability scanner agent"
arch=('x86_64')
depends=('gnupg')
makedepends=('inetutils')
license=('custom')
options=(!strip debug)
url="https://www.tenable.com/downloads/nessus-agents"
install="$pkgname.install"
source=("NessusAgent-$pkgver-fc34.$arch.rpm::https://www.tenable.com/downloads/api/v1/public/pages/${pkgname}s/downloads/17239/download?i_agree_to_tenable_license_agreement=true"
        LICENSE)
b2sums=('c004e1aad2914b54b8e4961a985bf7398c335869362a524d1e6132e21e73b17cd4b72a486c0e19fda0caf19914db1a4c3634b011cc5a80fd6d73e892f0214d78'
        '2c68d4f30686a711fbf5c77b70d9b307f9fdcc8095cea79d8c310edfeea87563d94b9106fce35fc53685e6703afb729b9d81f504a1983c367621605690ea03e1')

package() {
  mkdir -p "$pkgdir/etc/ld.so.conf.d" "$pkgdir/usr/share" "$pkgdir/opt/$pkgname" \
           "$pkgdir/usr/lib"

  cp -a usr/lib "$pkgdir/usr"

  # path to libraries
  echo /opt/${_pkgname}/lib > "$pkgdir/etc/ld.so.conf.d/nessus.conf"

  # main files
  cp -a opt/${_pkgname}/{bin,com,etc,lib,sbin,var} "$pkgdir/opt/$pkgname"

  # license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Fix path for /usr/lib/systemd/system/nessusagent.service
  ln -s /opt/$pkgname/ /opt/${_pkgname}
}

