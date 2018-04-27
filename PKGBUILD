# Maintainer: Félix Saparelli <aur@passcod.name>

pkgname=zoho-docs-bin
pkgver=1.9.2
pkgrel=2
pkgdesc="Graphical application to sync files to/from Zoho Docs"
arch=('x86_64')
url=""
license=('proprietary')
depends=()
source=('https://www.zoho.com/docs/36925/ZohoDocs_x64.tar.gz'
        'zoho-docs.desktop'
        'zohodocs.sh')
sha512sums=('2c103bc33b96116132069c0a7ccdc17f3db87baf5d81b870829a4e8e0980ff352f4d5ca79dabc4083e18cff99364d75e9249522b0623276ae4e3af0bc49daa07'
            'ff56d7461068689774d25209683d15804c5f186a611fb40f30bf7185e72061e1ce39464305da27b12d6f9e8ff21cb3b87ce377ef1bc7e981e17dfce25ecbfba0'
            '393f327cf71aa2d1724c893f2e967c0c465c7635ed503becd1762ed789fef56d5df0ad4b75abddb9407e4a428d48f5d53ddcb12a74d5e93d1ffc4ad56fba58e6')

build() {
  cd "$srcdir/zohodocs"
  rm *.desktop
  #head .setup -n308 > setup.sh # to figure out what to do
  tail .setup -n+310 | tar xz
  rm .setup
}

package() {
  install -d "$pkgdir"/{usr/{bin,share/applications},opt}
  install -Dm644 "$srcdir/zoho-docs.desktop" "$pkgdir/usr/share/applications/"
  install -Dm755 "$srcdir/zohodocs.sh" "$pkgdir/usr/bin/zohodocs"
  cp -r "$srcdir/zohodocs" "$pkgdir/opt/"
}
