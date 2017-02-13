# Maintainer: Kieran Colford <kieran@kcolford.com>
pkgname=ddns-git
pkgver=2.1.2.r2.g22ebdce
pkgrel=1
pkgdesc="Automatic provisioning of dynamic DNS"
arch=('any')
url="https://github.com/kcolford/ddns"
license=('GPL')
groups=()
depends=('bash' 'bind-tools' 'coreutils' 'inetutils' 'sed' 'systemd')
makedepends=('git')
optdepends=('curl: for looking up your ip address'
	    'openssh: for updating SSHFP records'
	    'postfix: MX records will be added if the mail server is online')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
options=()
install=
source=("git+$url")
md5sums=('SKIP')
noextract=()

pkgver() {
  cd "$srcdir/ddns"
  git describe --long | sed 's/v//;s/-/.r/;s/-/./g'
}

package() {
  cd "$srcdir/ddns"

  make DESTDIR="$pkgdir"/usr install
}
