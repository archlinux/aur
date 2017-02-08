# Maintainer: Kieran Colford <kieran@kcolford.com>
pkgname=ddns-git
pkgver=v2.1.0.r0.49b4994
pkgrel=2
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
source=("git+$url#master")
md5sums=('SKIP')
noextract=()

pkgver() {
  cd "$srcdir/ddns"
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
  cd "$srcdir/ddns"

  make DESTDIR="$pkgdir"/usr install
}
