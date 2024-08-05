# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="app-route-jail-git"
pkgver=r16.94b955b
pkgrel=2
pkgdesc="Tweaks to force application-specific routing on Linux"
url="https://github.com/Intika-Linux-Firewall/App-Route-Jail"
license=("custom:none")
arch=("any")
options=("!strip")
source=("git+$url.git")
b2sums=('SKIP')
install="$pkgname.install"

pkgver(){
 cd "App-Route-Jail"
 printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build(){
 cd "App-Route-Jail"
 gcc -D_GNU_SOURCE -o newns ./newns.c
 gcc -fPIC -c -o mark.o mark.c
 gcc -shared -o mark.so mark.o -ldl
}

package(){
 cd "App-Route-Jail"
 install -d "$pkgdir/usr/bin"
 install -d "$pkgdir/usr/lib"
 install -D -m 0755 newns "$pkgdir/usr/bin"
 install -D -m 0644 mark.so "$pkgdir/usr/lib"
}
