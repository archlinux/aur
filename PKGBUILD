# Maintainer: Randy Ramos <rramos1295 at gmail dot com>

pkgname='responder'
pkgver=2.3.0
pkgrel=1
pkgdesc='A LLMNR and NBT-NS poisoner, with built-in HTTP/SMB/MSSQL/FTP/LDAP rogue authentication server supporting NTLMv1/NTLMv2/LMv2, Extended Security NTLMSSP and Basic HTTP authentication.'
arch=('any')
depends=('python2')
makedepends=('git')
url='https://github.com/SpiderLabs/Responder/'
license=('GPL3')
source=($pkgname::"https://github.com/SpiderLabs/$pkgname/archive/v$pkgver.tar.gz" 'responder.sh' 'dhcp-responder.sh')
sha256sums=('7f11ca5e60f5187280fa45f3d0ddd3bef6d6d08fc48d1f90528ee452f46f6c1f'
			'658d17f895ad48a47babf885176a8a4e891219c7fd7d53141a1dbdbbaa0b9374'
			'a720b7c918c63ed27356f43b788a171729f0d88c42c01a901d64efb17aa92f78'
			)

package() {
  cd "$srcdir/Responder-$pkgver"

  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/usr/share/responder
  mkdir -p "$pkgdir"/usr/share/doc/responder

  install -Dm644 -t "$pkgdir"/usr/share/doc/responder README.md

  rm README.md

  cp -a * "$pkgdir"/usr/share/responder

  cd "$srcdir"

  install -m 755 responder.sh "$pkgdir"/usr/bin/responder
  install -m 755 dhcp-responder.sh "$pkgdir/usr/bin/dhcp-responder"
}
