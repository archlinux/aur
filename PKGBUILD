# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Thomas Zink <thomas.zink@uni-konstanz.de>
pkgname="gen-oath-safe-git"
pkgver=r22.23dd7af
pkgrel=2
#epoch=
pkgdesc="generate OTP uri, qrcode, and configurations for linOTP, mod_authn_otp, Yubikey"
arch=('x86_64')
url="https://github.com/72Zn/gen-oath-safe"
license=('MIT')
#groups=()
depends=('openssl' 'qrencode' 'xxd')
makedepends=('git' 'gzip')
#checkdepends=()
optdepends=('yubikey-personalization: yubikey support'  'yubikey-manager: yubikey totp support' )
#provides=()
#conflicts=()
#replaces=()
#backup=()
#options=()
#install=
#changelog=
#source=("$pkgname-$pkgver.tar.gz"
        #"$pkgname-$pkgver.patch")
source=("git+$url")
#noextract=()
md5sums=('SKIP')
validpgpkeys=('75EB2032F8AAE544A6468786D2B90FE25DB6B019')

_gitname="gen-oath-safe"

pkgver() {
  cd "$_gitname"
  #git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

#prepare() {
	#cd "$pkgname-$pkgver"
	#patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
#}

#build() {
    #cd "$pkgname"
    #./configure --prefix=/usr
    #make
#}

#check() {
	#cd "$pkgname-$pkgver"
	#make -k check
#}

package() {
	cd "$_gitname"
    install -Dm755 ./gen-oath-safe "$pkgdir/usr/local/bin/gen-oath-safe" 
    install -Dm644 ./gen-oath-safe.1 "$pkgdir/usr/local/man/man1/gen-oath-safe.1"
}
