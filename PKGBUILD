# Maintainer:  danyf90 <daniele.formichelli@gmail.com>
# Contributor: mac <poczciwiec at gmail dot com>

pkgname=yat-bin
_pkgname=yat
pkgver=0.1.3
pkgrel=2
pkgdesc="Yet Another Terminal, a Terminal Emulator written with the web languages of the future. Today. Extensible, themeable."
arch=("i686" "x86_64")
url="https://github.com/LucaT1/yat"
license=("MIT")
depends=('nodejs')
provides=("yat=$pkgver")
conflicts=('yat' 'yat-git')

  source_i686=("$url/releases/download/v$pkgver/yat_${pkgver}_i386.deb"
               "https://raw.githubusercontent.com/LucaT1/yat/master/LICENSE.md")
source_x86_64=("$url/releases/download/v$pkgver/yat_${pkgver}_amd64.deb"
               "https://raw.githubusercontent.com/LucaT1/yat/master/LICENSE.md")
sha512sums_i686=('ad9c3edc3ff15d3c298ecaf041a939aef04d671a7f005aab51a3772b75e0482461d2be8535e92e0aa54c85e2b7fc50bafe786a61ca4e94bfd71d83de881045d6'
                 '79db0d3c045c65adf54bfb486c060fc0ccb817fc9d83b5e33d3dc7b6cf8c4273cc93b72268300821d6040c54623eace8d6e49eaaa1965fcc9631da8b1b5d902c')
sha512sums_x86_64=('63734ae4547266512d7bd6cc1d84a502c805d4c459bcac1d421df4dea333bfd6abfecc483a6d088e485da884cf30bd7b53444824ce53d5b893a1f35162030882'
                   '79db0d3c045c65adf54bfb486c060fc0ccb817fc9d83b5e33d3dc7b6cf8c4273cc93b72268300821d6040c54623eace8d6e49eaaa1965fcc9631da8b1b5d902c')

 
prepare() {
  cd $srcdir

  msg2 "  -> Extracting files..."
  tar -xf data.tar.xz

  msg2 "  -> Fixing executable stack..."
}

package() {
  cd $srcdir

  msg2 "  -> Installing program..."

  install -d $pkgdir/opt
  cp -r opt/$_pkgname $pkgdir/opt/$_pkgname

  install -d $pkgdir/usr/bin
  ln -s /opt/$_pkgname/$_pkgname $pkgdir/usr/bin/$_pkgname

  cp -r usr $pkgdir/

  install -Dm755 LICENSE.md $pkgdir/usr/share/licenses/$_pkgname/LICENSE
}
