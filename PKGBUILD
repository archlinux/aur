# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Contributor: Yardena Cohen <yardenack at gmail dot com>
# quick check for commits https://git.php.net/?p=pecl/networking/ssh2.git;a=shortlog
# Please report issues at https://github.com/sanduhrs/arch-aur-php-ssh-git

_pkgname=php-ssh
pkgname=${_pkgname}-git
pkgver=r173.df27bec
pkgrel=1
pkgdesc="An SSH2 extension for PHP"
url="http://pecl.php.net/package/ssh2"
license=('PHP')
arch=('i686' 'x86_64')
depends=('php>=7.0.0' 'openssh')
makedepends=('php>=7.0.0' 'git')
provides=('php-ssh')
conflicts=('php-ssh')
install=${_pkgname}.install
source=("${pkgname}::git+https://git.php.net/repository/pecl/networking/ssh2.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  phpize
  ./configure --prefix=/usr --with-ssh2
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  echo ';extension=ssh2.so' > ssh2.ini
  install -Dm644 ssh2.ini "${pkgdir}/etc/php/conf.d/ssh2.ini"
  make install INSTALL_ROOT="${pkgdir}/"
}
