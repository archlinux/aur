# Maintainer: EndlessEden <eden [at] rose.place>
pkgname=craftycontroller-git
_pkgname=craftycontroller
pkgver=3.3.0.r9.gc63984a
pkgrel=1
pkgdesc="Crafty is a Minecraft Server Wrapper / Controller / Launcher."
arch=('x86_64')
url="https://craftycontrol.com/"
license=('GPL')
depends=('python' 'python-pip' 'java-runtime=8' 'python-argon2_cffi' 'python-bleach' 'python-colorama' 'python-peewee' 'python-pexpect' 'python-psutil' 'python-pyftpdlib' 'python-pyopenssl' 'python-pyaml' 'python-requests' 'python-schedule' 'python-termcolor' 'python-tornado' 'python-pipenv')
makedepends=('git')
provides=("$pkgname" "$_pkgname")
conflicts=("$_pkgname")
install="$_pkgname.install"
source=("$_pkgname"::"git+https://gitlab.com/crafty-controller/crafty-web.git"
"$_pkgname.install"
"$_pkgname.service"
"start.sh")
md5sums=('SKIP'
'SKIP'
'2e7d24f5d2982fc6f7ac224378cf2f02'
'0b6cd32e5c31ed3bb576f5ad652c0db6')

pkgver() {
  cd "$srcdir"/"$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}


package() {
  cd "$srcdir"/"$_pkgname"
  mkdir -p "$pkgdir"/opt/craftycontroller/
  cp -r * "$pkgdir"/opt/craftycontroller/
  mkdir -p "$pkgdir"/etc/systemd/system/
  cp "$srcdir"/"$_pkgname.service" "$pkgdir"/etc/systemd/system/
  install -m774 "$srcdir"/"start.sh" "$pkgdir"/opt/craftycontroller/
}
