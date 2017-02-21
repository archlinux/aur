# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Maintainer: Tom v/d Brink <tomracing at gmail>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: ximeg <ximeg@tomcity.net>
# Maintainer: desperat <c2h5ohzh2@o2.pl>
# Maintainer: Mihai Coman <mihai@m1x.ro>
# http://smath.info/file/yNr4Q/SMathStudioDesktop.0_98_6179.Mono.tar.gz
# http://smath.info/?file=739152 

pkgname=smath
pkgver=0_98_6179
pkgrel=1
pkgdesc="A mathematical program with many features and paper-like interface, similar to Mathcad"
arch=('i686' 'x86_64')
url="http://smath.info"
license=('CCPL')
groups=('math')
depends=('mono')
install=smath.install
backup=(opt/$pkgname/settings.inf)
source=("https://dl.dropboxusercontent.com/u/24193509/SMathStudioDesktop.0_98_6179.Mono.tar.gz" 
	"smath.desktop" 
	"https://dl.dropboxusercontent.com/u/24193509/SMathStudioLogo256.png")
md5sums=('4931c118ee1d23b406aaf717a740b613'
         'af70c1bfb5bcdaab7f952339ebb2435e'
         'ed3720462decbcfa63df5c9d04fb03f9')

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
  install -Dm644 "${srcdir}/smath.desktop" "${pkgdir}/usr/share/applications/smath.desktop"
  install -Dm644 "${srcdir}/SMathStudioLogo256.png" "${pkgdir}/usr/share/pixmaps/smath.png"

}
