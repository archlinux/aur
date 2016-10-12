

#build() {
  #cd "$srcdir/${pkgname%-git}"
  #autoreconf --force --install --symlink
  #./configure --prefix=/usr
  #make
#}

#check() {
  #cd "$srcdir/${pkgname%-git}"
  #make -k check
#}

#package() {
  #cd "$srcdir/${pkgname%-git}"
  #make DESTDIR="$pkgdir/" install
#}




####################

# and remove these comments. For more information, see 'man PKGBUILD'.

# Maintainer: binaryplease <binaryplease@gmail.com>
pkgname=fluxion-git
pkgver=0.0.0
pkgrel=1
pkgdesc="Fluxion is a remake of linset by vk496 with less bugs and more features."
arch=('x86_64' 'i686')
url="https://github.com/deltaxflux/fluxion"
license=('GNU')
groups=()
makedepends=('git')
depends=('git' 'aircrack-ng' 'gawk' 'bully' 'curl' 'dhcp' 'hostapd' 'wireless_tools' 'lighttpd' 'macchanger' 'mdk3' 'nmap' 'openssl' 'php-cgi' 'pyrit' 'python' 'reaver' 'rfkill' 'unzip' 'xterm' 'zenity' 'binutils')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("${pkgname%-git}::git+https://github.com/deltaxflux/fluxion.git#branch=master")
noextract=()
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-git}"


# Git, tags available
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

# Git, no tags available
	#printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	patch -p1 -i "$srcdir/${pkgname%-git}.patch"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	./autogen.sh
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/${pkgname%-git}"
	make -k check
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
