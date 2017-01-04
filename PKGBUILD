# Maintainer: Kieran Colford <kieran@kcolford.com>
pkgname=ddns-git
pkgver=r41.6ee373e
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
backup=('etc/ddns.conf')
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

  install -Dm755 ddns "$pkgdir/usr/bin/ddns"
  install -Dm644 ddns.conf "$pkgdir/etc/ddns.conf"
  install -Dm644 systemd/ddns.service "$pkgdir/usr/lib/systemd/system/ddns.service"
  install -Dm644 systemd/ddns.timer "$pkgdir/usr/lib/systemd/system/ddns.timer"
  mkdir -pm755 "$pkgdir/etc/ddns/"
}
