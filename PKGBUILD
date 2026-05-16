# Maintainer: William Ghazarian <lvswgh at proton dot me>
# Contributor: 

pkgname="marvin-cli-bin"
pkgver=1.5.0
pkgrel=1
pkgdesc="A command-line tool for interfacing with the Amazing Marvin desktop app and public API. (unofficial)"
arch=("x86_64")
url="https://github.com/k-and/marvin-cli"
license=("MIT")
depends=()
options=('!debug' '!strip')
optdepends=('amazingmarvin-appimage')
provides=('marvin-cli')
conflicts=('marvin-cli')

source=(
    "marvin-cli-$pkgver::https://github.com/k-and/marvin-cli/releases/download/v$pkgver/marvin-cli-linux"
    "LICENSE::https://raw.githubusercontent.com/k-and/marvin-cli/v$pkgver/LICENSE"
)

sha256sums=('968c70ec54b313dc3ae791c0b5acb9c7f0daf39c1ec537c03663ba1bfed4fc15'
            '8c87c28eb30561ffc93653d15087a2364fbd522b17895620823bcd5efc96632c')

package() {
    install -Dm755 "$srcdir/marvin-cli-$pkgver" "$pkgdir/opt/$pkgname/marvin"


    install -d "$pkgdir/usr/bin"
    ln -sf "/opt/$pkgname/marvin" "$pkgdir/usr/bin/marvin"

    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"


    echo "
================================================================================
>>> IMPORTANT: First time? Run 'marvin config apiToken <YourAPIToken>' 
to authenticate!
Also note that some commands will only work if you have a running desktop
application and have enabled the Local API in the API strategy.

If command is silent: try to build yourself with makepkg instead of an
AUR wrapper.
================================================================================
"
}