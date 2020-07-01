# Maintainer: Solomon Choina <shlomochoina@gmail.com>
# The place where the .tar.gz is located is https://discord.gg/ygopro-percy
DLAGENTS=(https::/usr/bin/megadl --no-progress %u)
pkgname=edopro-bin
pkgver=38.1.2
pkgrel=1
megaurl=https://mega.nz/file/ACYxhSbR#LEFiGgc00FICHLkomtSJEaU2c1NHm2cOwhlp6JE0Z9E
pkgdesc="Link compatable ygopro client with AI"
arch=('x86_64')
url='https://github.com/edo9300/edopro'
license=('GPL2')
depends=('mono' 'libevent' 'libglvnd' 'freetype2')
makedepends=('megatools')
source=("ProjectIgnis-EDOPro-$pkgver-linux.tar.gz::$megaurl" 
        "io.github.edo9300.EDOPro.desktop")
sha256sums=('441439b2fe578d9538e2b93c2c753fa1a9224083abfcb6c5b1028c8453e3c131'
            '831c8d915064e997162ee172af1765b3105e8191f914b013317b3efa3906ef96')
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
