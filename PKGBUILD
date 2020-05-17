# Maintainer: Solomon Choina <shlomochoina@gmail.com>
# The place where the .tar.gz is located is https://discord.gg/ygopro-percy
DLAGENTS=(https::/usr/bin/mego %u)
pkgname=edopro-bin
pkgver=38.1.0
pkgrel=1
megaurl=https://mega.nz/file/NH4WSQiY#1hI3KjX66zUqoX6-RBezpQmmXwMLLeqYzgRJDluHKE8
pkgdesc="Link compatable ygopro client with AI"
arch=('x86_64')
url='https://github.com/edo9300/edopro'
license=('GPL2')
depends=('mono' 'libevent' 'libglvnd' 'freetype2')
makedepends=('mego')
source=("ProjectIgnis-EDOPro-$pkgver-linux.tar.gz::https://mega.nz/file/NH4WSQiY#1hI3KjX66zUqoX6-RBezpQmmXwMLLeqYzgRJDluHKE8" 
        "io.github.edo9300.EDOPro.desktop")
sha256sums=('df9f50b6e4c8d157f03f5797dbf13be5c79b9006088e9b4863c7a228735f095b'
            '0a9d949f027004c3ef86ba0eaf30e131d4f8c34994ca5fae72cbe08e740d99c7')
options=('emptydirs')

package(){
  outputDir="$pkgdir/opt/edopro"
  mkdir -p $outputDir
  cp -dR ProjectIgnis/* $outputDir
	find $outputDir -type d -exec chmod 777 {} \;
	find $outputDir -type f -exec chmod 777 {} \;
  install -D io.github.edo9300.EDOPro.desktop $pkgdir/usr/share/applications/io.github.edo9300.EDOPro.desktop

   install -Dm755 /dev/stdin "$pkgdir"/usr/bin/EDOPro <<END
  #!/usr/bin/bash
  cd /opt/edopro
  /opt/edopro/EDOPro

END

    # uncomment to get rid of the default decks if wanted
    #rm $outputDir/deck/*
}
