# Maintainer: ahrs <Forward dot to at hotmail dot co dot uk>

pkgname='alkasir-client'
pkgver=0.4.7
pkgrel=1
arch=('x86_64')
_arch="amd64" # Change to '386' to install the 32 bit client
url="https://alkasir.com/"
depends=('glibc')
makedepends=('links') # Links is needed to download the license agreement
optdepends=('google-chrome'
            'chromium'
)
licenseURL='https://alkasir.com/en/License.html'
license=("custom"
         "$licenseURL"
)
pkgdesc="Alkasir is a cross-platform, open-source and robust website censorship circumvention tool that also maps censorship patterns around the world."
source=("https://github.com/alkasir/alkasir/releases/download/$pkgver/alkasir-client_linux-$_arch.tar.gz"
        "alkasir-client.service")
md5sums=('8490b46497d51de548341cf81d7989ee'
         '741b2eee3c554d555f932cf0011da922'
)
install="alkasir-client.install"

_pkgarchive="alkasir-client-linux-$_arch"

prepare() {
   # The client currently isn't distributed with a license so we download it from the web...
   if [ ! -f "$srcdir/$_pkgarchive/LICENSE" ]
   then
     links -dump "$licenseURL" > "$srcdir/$_pkgarchive/LICENSE"
   fi
}

package() {
   mkdir -p "$pkgdir/opt/$pkgname-linux-$_arch"

   cp -a "$srcdir/$_pkgarchive/." "$pkgdir/opt/$pkgname-linux-amd64/"

   install -D -m644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/user/$pkgname.service"

   install -D -m644 "$srcdir/$_pkgarchive/LICENSE" "$pkgdir/usr/share/licenses/$_pkgarchive/LICENSE"
}
