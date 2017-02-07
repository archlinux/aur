# Maintainer: Kieran Colford <kieran@kcolford.com>
pkgname=ddns-git
pkgver=r45.c43d866
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
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/ddns"

  mkdir -p "$pkgdir"/{etc/ddns,usr/{bin,lib/systemd/system}}
  install ddns "$pkgdir/usr/bin/ddns"
  cp systemd/ddns.{service,timer} "$pkgdir"/usr/lib/systemd/system
}
