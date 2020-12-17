# Maintainer: Max Gautier <mg+archlinux@max.gautier.name>
# Maintainer: Ema Panz <thepanz+aur at gmail dot com>
# Contributor: Jeff Henson <jeff@henson.io>

pkgname=origin-client
pkgdesc="Openshift client"
pkgver=4.6
pkgrel=3
arch=('x86_64')
url="https://github.com/openshift/oc"
license=('Apache')
makedepends=('go-pie')
source=("https://github.com/openshift/oc/archive/release-${pkgver}.zip")
# The upstream dodes not seems to publish tagged releases
# (the tags have all timestamps informations in it, *not* helpful)
sha256sums=('680943a11c9385f490464274ec8abe9f86945dc4561feb01aba58566f9b2b81e')

build() {
  cd "oc-release-$pkgver"
  make
}

#check() { # Checks are broken right now
#  cd "oc-release-$pkgver"
#  make verify test
#}

package() {

  cd "oc-release-$pkgver"
  install -Dm755 oc -t "$pkgdir/usr/bin"
  install -dm 755 "$pkgdir/usr/share/man/man1"
  ./genman "$pkgdir/usr/share/man/man1" oc
  install -Dm644 contrib/completions/bash/oc "$pkgdir/usr/share/bash-completion/completions/oc"
  install -Dm644 contrib/completions/zsh/oc "$pkgdir/usr/share/zsh/site-functions/_oc"
}
