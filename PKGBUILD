# Maintainer: noraj <printf %s 'YWxleGFuZHJlLnphbm5pQGV1cm9wZS5jb20='|base64 -d>
# Contributor: neale

pkgname=nessus-agent
_pkgname=nessus_agent
pkgver=10.5.1
pkgrel=1
pkgdesc="Nessus vulnerability scanner agent"
arch=('x86_64')
depends=('gnupg')
makedepends=('inetutils')
license=('custom')
options=(!strip debug)
url="https://www.tenable.com/downloads/nessus-agents"
install="$pkgname.install"
source=("NessusAgent-$pkgver-fc34.$arch.rpm::https://www.tenable.com/downloads/api/v1/public/pages/nessus-agents/downloads/21856/download?i_agree_to_tenable_license_agreement=true"
        LICENSE)
b2sums=('a5402500e4e62c3f6975a6a1cf8b84332533858a5c651182a8e49897a219cae86cfe91a6dd4f94d2ed3ccc3b03df4ee07d088d1094ca27c6d78b0dbc8548d93d'
        '2c68d4f30686a711fbf5c77b70d9b307f9fdcc8095cea79d8c310edfeea87563d94b9106fce35fc53685e6703afb729b9d81f504a1983c367621605690ea03e1')
conflicts=('nessus') # due to /etc/ld.so.conf.d/nessus.conf

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
}

