# Maintainer: Alex Gentilucci <alexander.gentilucci@gmail.com>
pkgname=zilf
pkgver=0.9.0
pkgrel=0
epoch=
pkgdesc="Tools for working with the ZIL fiction language, including a compiler and assembler"
arch=('x86_64')
url="https://bitbucket.org/jmcgrew/zilf"
license=('GPL')
options=('!strip')
source=("https://bitbucket.org/jmcgrew/zilf/downloads/zilf-$pkgver-linux-x64.tar.gz"
				"https://bitbucket.org/jmcgrew/zilf/downloads")
sha512sums=('afc1c54d4fa8d4910ce61c3619ccfc9cb8fd16bdb70cdc0c2ddbebbce4e3abe9064f46ae29e358060d9a80c827a9d73062c9ef89df371f61e151bf16777216e9'
            'SKIP') 

prepare() {
  _commit=$(grep -oE "get\/([0-9a-fA-F]+)" downloads | cut -c 5-)
  curl -O "https://bitbucket.org/jmcgrew/zilf/get/$_commit.zip"
  unzip -q "$_commit.zip" -d "$srcdir" 
}

package() {
  _commit=$(grep -oE "get\/([0-9a-fA-F]+)" downloads | cut -c 5-)
	install -d -m 755 "$pkgdir/usr/lib/zilf"
	install -d -m 755 "$pkgdir/usr/lib/zilf/library"
	cp -dpr --no-preserve=ownership "$srcdir/$pkgname-$pkgver-linux-x64/bin/"* "$pkgdir/usr/lib/zilf"
  cp -dpr --no-preserve=ownership "$srcdir/jmcgrew-zilf-$_commit/zillib/"* "$pkgdir/usr/lib/zilf/library/"
	chmod ugo+x "$pkgdir/usr/lib/zilf/zilf"
	chmod ugo+x "$pkgdir/usr/lib/zilf/zapf"
  mkdir -p ${pkgdir}/usr/bin
  ln -sf "/usr/lib/zilf/zilf" "$pkgdir/usr/bin/zilf"
  ln -sf "/usr/lib/zilf/zapf" "$pkgdir/usr/bin/zapf"
}
