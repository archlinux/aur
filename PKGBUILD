# Maintainer: Yardena Cohen <yardenack at gmail dot com>
# quick check for commits https://git.php.net/?p=pecl/networking/ssh2.git;a=shortlog

pkgname=php-ssh-git
pkgver=135.ddaa6a0
pkgrel=2
pkgdesc="An SSH2 extension for PHP (git version)"
url="http://pecl.php.net/package/ssh2"
license=('PHP')
arch=('i686' 'x86_64')
depends=('php' 'openssh')
makedepends=('php' 'git')
provides=('php-ssh')
conflicts=('php-ssh')
install=install
source=("ssh2::git+https://github.com/yardenac/php-ssh2.git#commit=ddaa6a0")
md5sums=('SKIP')

pkgver() {
	 cd "${srcdir}/ssh2"
	 local ver="$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
	 printf "%s" "${ver//-/.}"
}

build() {
	 cd "${srcdir}/ssh2"
	 phpize
	 ./configure --prefix=/usr --with-ssh2
	 make
}

package() {
	 cd "${srcdir}/ssh2"
	 make install INSTALL_ROOT="${pkgdir}/"
}
