# Maintainer: Solomon Choina <shlomochoina@gmail.com>
# The place where the .tar.gz is located is https://discord.gg/ygopro-percy
pkgname=edopro-bin
pkgver=38.0.1
pkgrel=1
pkgdesc="Link compatable ygopro client with AI"
arch=('x86_64')
url='https://github.com/edo9300/edopro'
license=('GPL2')
depends=('mono' 'libevent' 'libglvnd' 'freetype2')
makedepends=('patchelf')
source=("local://ProjectIgnis-EDOPro-$pkgver-linux.tar.gz"
        "io.github.edo9300.EDOPro.desktop")
sha256sums=('fc479c00625450091ecf3ff0a1b33eb75cc4625bbd2d8068f0844c2a4c19894c'
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
