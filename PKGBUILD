# Maintainer: Jonathan Steel <jsteel at aur.archlinux.org>
# Contributor: Ido Rosen <ido@kernel.org>
# Contributor: Brett Hoerner <brett@bretthoerner.com>
# Contributor: Jochen Schalanda <jochen+aur@schalanda.name>
# Contributor: Mathieu Clabaut <mathieu.clabaut@gmail.com>
# Contributor: helios <aur@wiresphere.de>
# Contributor: George Ornbo <gornbo@gmail.com>
# Contributor: Niklas Heer <niklas.heer@me.com>
# Contributor: Steven Nance <steven@devtrw.com>

pkgname=vagrant
pkgver=1.5.1
pkgrel=3
pkgdesc="Build and distribute virtualized development environments"
arch=('i686' 'x86_64')
url="http://vagrantup.com"
license=('MIT')
options=('!emptydirs')
makedepends=('git')
depends=('ruby' 'curl' 'lzo2' 'libidn' 'rtmpdump')
source=(git://github.com/mitchellh/$pkgname.git
        git://github.com/mitchellh/$pkgname-installers.git
        http://pkgbuild.com/~jsteel/aur/$pkgname/substrate_archlinux_$CARCH.zip)
md5sums=('SKIP' 'SKIP')
[[ $CARCH == i686 ]] && md5sums[2]='c04042b24de56d18a041bc005e5ecaa4'
[[ $CARCH == x86_64 ]] && md5sums[2]='53d8a137e0b50fee8509a7d1c15fd33b'

build() {
  cd "$srcdir"/$pkgname
    REV=$( git log --grep ^v$pkgver$ --pretty=format:"%H" | head -n 1 )

  "$srcdir"/$pkgname-installers/package/support/install_$pkgname.sh \
    "$srcdir"/substrate/ $REV "$srcdir"/substrate/${pkgname}_version
}

package() {
  install -d "$pkgdir"/{opt/,usr/bin/}

  cp -r "$srcdir"/substrate/ "$pkgdir"/opt/$pkgname/

  ln -s /opt/$pkgname/bin/$pkgname "$pkgdir"/usr/bin/$pkgname
}
