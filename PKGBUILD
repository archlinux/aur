# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="people-git"
pkgver=r50.0917002
pkgrel=1
pkgdesc="A CLI tool for tracking the number of days since you have made contact with your network"
url="https://github.com/CallumBeaney/people"
license=("MIT")
arch=("x86_64" "armv7h" "aarch64")
# these packages come with /usr/bin/people
conflicts=("fortune-mod" "misfortune" "tracker3-docs")
source=("git+$url")
b2sums=("SKIP")

pkgver() {
 cd "${pkgname/-git/}"
 printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build(){
 cd "${pkgname/-git/}"
 gcc -o "people" src/main.c src/helpers.c src/mainFunctions.c   
}

package(){
 cd "${pkgname/-git/}"
 install -D -m 755 "people" "$pkgdir/usr/bin/people"
 # data will be stored in $HOME/people
}
