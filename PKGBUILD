# quick check for commits https://git.php.net/?p=pecl/networking/ssh2.git;a=shortlog

pkgname=php-ssh-git
pkgver=134.aa5adbd
pkgrel=1
pkgdesc="An SSH2 extension for PHP (git version)"
url="http://pecl.php.net/package/ssh2"
license=('PHP')
arch=('i686' 'x86_64')
depends=('php' 'openssh')
makedepends=('php' 'git')
provides=('php-ssh')
conflicts=('php-ssh')
install=install
source=("git+https://git.php.net/repository/pecl/networking/ssh2.git")
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
