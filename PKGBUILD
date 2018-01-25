# Maintainer: Paul Taylor <bao7uo at gmail dot com>
# Contributer: ArchStrike <team@archstrike.org>

buildarch=1

pkgname=crackmapexec
_pkgname=CrackMapExec
pkgver=3.1.5
pkgrel=1
groups=('archstrike' 'archstrike-exploit')
pkgdesc='A swiss army knife for pentesting Windows/Active Directory environments'
arch=('any')
url='https://github.com/byt3bl33d3r/CrackMapExec'
license=('GPL3')
depends=('impacket' 'python2-gevent' 'python2-netaddr' 'python2-crypto' 'python2-pyasn1' 'python2-termcolor' 'python2-colorama' 'python2-pyopenssl' 'python2-msgpack' 'python2-requests')
makedepends=('python2-setuptools')
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('c7501afc0f659466eca76863c8afeb262150f3f13ccf9d21412e69b114295c28ba001e979aae014124b31653a0a95a5a4afc5970892d01454f9941a82b6182ec')

package() {
  cd $_pkgname-$pkgver
  python2 setup.py install --root=${pkgdir} --optimize=1

  # Install the license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # fix python issues
  sed -i 's|python|python2|' $pkgdir/usr/lib/python2.7/site-packages/cme/enum/users.py $pkgdir/usr/lib/python2.7/site-packages/cme/enum/wmiquery.py $pkgdir/usr/lib/python2.7/site-packages/cme/enum/lookupsid.py
}
