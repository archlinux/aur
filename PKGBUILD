# Maintainer: YesDay <yesdayuk[you know]gmail[you know]com>
_pkgname=dracut-crypt-ssh
pkgname=$_pkgname-git
pkgver=1.0.3.r3.g70e0fd5
pkgrel=1
pkgdesc='Dracut initramfs module to start dropbear sshd during boot to 
enter LUKS passphrase remotely'
arch=('i686' 'x86_64' 'aarch64')
url='https://github.com/dracut-crypt-ssh/dracut-crypt-ssh'
license=('GPL2')
depends=('dracut' 'dhclient' 'dropbear')
makedepends=('git' 'sed')
provides=("$_pkgname")
conflicts=("$_pkgname")
backup=('etc/dracut.conf.d/crypt-ssh.conf')
source=("$_pkgname::git+https://github.com/$_pkgname/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$_pkgname"
    ./configure --prefix=/usr
    make
}

# Check target is not available.
# make: *** No rule to make target 'check'.
#check() {
#    cd "$srcdir/$_pkgname"
#    make -k check
#}

package() {
    cd "$srcdir/$_pkgname"
    make DESTDIR="$pkgdir/" install
}
