# Maintainer: ZappaBoy <federico.zappone@justanother.group>
pkgname=domo-git
pkgbase=domo-git
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="Simple tool to manage IoT devices"
arch=('i686' 'x86_64')
url="https://github.com/ZappaBoy/domo"
source=("git+https://github.com/ZappaBoy/domo")
md5sums=('SKIP')
license=('GPL')
depends=(
  "python"
  "python-certifi"
  "python-charset-normalizer"
  "python-colorama"
  "python-idna"
  "python-pycryptodome"
  "python-requests"
  "python-urllib3")
makedepends=("git" "python-pip")
provides=("domo")

prepare() {
  cd "$srcdir/domo"
  python -m pip install -r requirements.txt
}

instructions() {
  /bin/cat << EOF
Remember to create the config.json in your DOMO_ROOT
EOF
}

package() {
  cd "$srcdir/domo/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm755 domo.py $HOME/.local/bin/domo
  instructions
}

# vim:set ts=2 sw=2 et:
