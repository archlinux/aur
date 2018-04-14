# Maintainer: TC <crt@archlinux.email>
_pkgname=profanity-omemo-plugin
pkgname=$_pkgname-git
pkgver=v0.1.1.46.ga1c77a8
pkgrel=3
pkgdesc="A Python plugin to use (axolotl / Signal Protocol) encryption for the profanity XMPP messenger"
arch=('any')
url="https://github.com/ReneVolution/profanity-omemo-plugin"
license=('GPL3')
depends=('python2-cryptography')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
install=profanity-omemo-plugin.install
options=('emptydirs')
source=("$_pkgname::git+https://github.com/ReneVolution/profanity-omemo-plugin.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --tags | sed 's|-|.|g'
}

package() {
  cd "$srcdir/$_pkgname"

  # install omemo plugin
  python setup.py install --force --user --prefix=
  install -D -m644 deploy/prof_omemo_plugin.py "$pkgdir/usr/local/share/profanity/plugins/prof_omemo_plugin.py"

  # install license
  install -D -m644 COPYING "$pkgdir"/usr/share/licenses/"$_pkgname"/LICENSE
}
