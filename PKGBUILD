# Maintainer: Franck Stauffer <franck.stauffer@monaco.mc>
# Contributor: GI_Jack <iamjacksemail@hackermail.com>
# Contributor: Xavier Devlamynck <magicrhesus@ouranos.be>

pkgname=sipvicious
pkgver=0.3.1
pkgrel=2
pkgdesc="Set of security tools that can be used to audit SIP based VoIP systems"
arch=('any')
url="https://github.com/EnableSecurity/sipvicious"
license=('GPL3')
depends=('python>=3.6')
optdepends=('python-scapy: allow svcrash to crash SIPVicious toolset')
makedepends=('python-setuptools')
changelog=$pkgname.changelog
source=("$pkgname-$pkgver.tar.gz::https://github.com/EnableSecurity/sipvicious/tarball/384c9d432a87568a4f3df9d4aefc8fdfbaecabc4"
        "https://raw.githubusercontent.com/EnableSecurity/sipvicious/master/LICENSE")
noextract=("LICENSE")
b2sums=('f314601435f6e7acb6474550d36d209d60213c6e8dd5ca569072b58877035727630d72205e7feeb74ef2c538b4f2c6a322d67316fb500e4304aeeae835d474ee'
        '583328dc620cc2fddcfc4114d2d772820c815d7269cb231cec46fd6e2bc78d5c816da2183be5707a50b3c0a97cc99719679a5d394a8c11a72e30901822b69673')

prepare() {
  cd "$srcdir/EnableSecurity-sipvicious-384c9d4"

  sed -i "s/sipvicious_//" setup.py
}

build() {
  cd "$srcdir/EnableSecurity-sipvicious-384c9d4"

  python setup.py build
}

package() {
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  cd "$srcdir/EnableSecurity-sipvicious-384c9d4"

  python setup.py install -O2 --skip-build --root="$pkgdir"

  install -dm755 "$pkgdir/usr/share/man/man1"
  gzip -c --best man1/svcrack.1  > "$pkgdir/usr/share/man/man1/svcrack.1.gz"
  gzip -c --best man1/svcrash.1  > "$pkgdir/usr/share/man/man1/svcrash.1.gz"
  gzip -c --best man1/svmap.1    > "$pkgdir/usr/share/man/man1/svmap.1.gz"
  gzip -c --best man1/svreport.1 > "$pkgdir/usr/share/man/man1/svreport.1.gz"
  gzip -c --best man1/svwar.1    > "$pkgdir/usr/share/man/man1/svwar.1.gz"
}
