# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Maintainer: Tom v/d Brink <tomracing at gmail>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: ximeg <ximeg@tomcity.net>
# Maintainer: desperat <c2h5ohzh2@o2.pl>
# Maintainer: Mihai Coman <mihai@m1x.ro>
# Credits to: Jake <> for solving the server download definitions
# http://smath.info

pkgname=smath
pkgver=1_1_8763
pkgrel=1
pkgdesc="A mathematical program with many features and paper-like interface, similar to Mathcad"
_pkgcode=w3XHB
arch=('i686' 'x86_64')
url="http://smath.info"
license=('CCPL')
groups=('math')
depends=('mono')
install=smath.install
backup=(opt/$pkgname/settings.inf)
source=("https://smath.com/file/${_pkgcode}/SMathStudioDesktop.${pkgver}.Mono.tar.gz")
md5sums=('0e3c05eb81a82dbcce2ef04904624b2b')
DLAGENTS=("https::/usr/bin/wget --post-data RefMem=&PostBack=${_pkgcode} %u")

package() {
  cd "$srcdir"
  # install program
  install -m755 -d "$pkgdir"/opt/$pkgname/{book,examples,lang,entries,plugins,snippets}
  install -m644 -t "$pkgdir"/opt/$pkgname/book book/*
  install -m644 -t "$pkgdir"/opt/$pkgname/examples examples/*
  install -m644 -t "$pkgdir"/opt/$pkgname/lang lang/*
  install -m644 -t "$pkgdir"/opt/$pkgname *.{dll,exe}
  install -m644 -t "$pkgdir"/opt/$pkgname/entries entries/*
  install -m644 -t "$pkgdir"/opt/$pkgname/plugins plugins/*
  install -m644 -t "$pkgdir"/opt/$pkgname/snippets snippets/*

  # create settings file
  touch "$pkgdir"/opt/$pkgname/settings.inf
  chmod 664 "$pkgdir"/opt/$pkgname/settings.inf

echo "#!/bin/sh
cd /opt/smath
mono SMathStudio_Desktop.exe \"$@\"
" > ../$pkgname.sh

  # install launcher
  install -Dm755 ../$pkgname.sh "$pkgdir"/usr/bin/$pkgname
  install -Dm644 "${startdir}/smath.desktop" "${pkgdir}/usr/share/applications/smath.desktop"
  install -Dm644 "${startdir}/SMathStudioLogo256.png" "${pkgdir}/usr/share/pixmaps/smath.png"

}
