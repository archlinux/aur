# Maintainer: Franck Stauffer <franck.stauffer@telecom-sudparis.eu>
# Contributor: GI_Jack <iamjacksemail@hackermail.com>
# Contributor: Xavier Devlamynck <magicrhesus@ouranos.be>

pkgname=sipvicious
pkgver=0.3.0
pkgrel=2
pkgdesc="SIPVicious is a set of tools that can be used to audit SIP VoIP systems."
arch=('any')
url="https://github.com/EnableSecurity/sipvicious"
license=('GPL3')
depends=('python>=3.6' 'python-scapy')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/EnableSecurity/$pkgname/archive/v$pkgver.tar.gz")
b2sums=('5ddcdf775db0ade6e61e77009c7991d8523db02dbdd6e8588c23f5cd6f4d2868dd1d78e7f17322cde67414b4eb2b8c89f2d4ee0079487e5f5f7ee75f4759adf5')

package() {
  readonly _PROGS=('svcrack' 'svcrash' 'svmap' 'svreport' 'svwar')

  cd $srcdir/$pkgname-$pkgver
  
  install -dm755 $pkgdir/usr/share/man/man1
  for _PROG in "${_PROGS[@]}"; do
    gzip -c --best man1/$_PROG.1 > man1/$_PROG.1.gz
    install -Dm644 man1/$_PROG.1.gz $pkgdir/usr/share/man/man1/$_PROG.1.gz
  done

  chmod +x setup.py
  ./setup.py install --root=$pkgdir

  for _PROG in "${_PROGS[@]}"; do
    mv $pkgdir/usr/bin/sipvicious_$_PROG $pkgdir/usr/bin/$_PROG
  done
}
